#!/bin/bash

function append_and_commit()
{
    local file_name_to_be_appended_and_committed="index.html"
    local file_content=$1
    local commit_message=$2

    echo $file_content >> $file_name_to_be_appended_and_committed

    git add $file_name_to_be_appended_and_committed

    git commit -m "$commit_message"

    sleep 1
}

git checkout -b branch1
append_and_commit "C2 in branch1; when this branch will be merged into master it will be a fast-forward merge" "C2-branch1"

echo "$0 completed!"
