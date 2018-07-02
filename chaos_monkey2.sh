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

append_and_commit "C3 in master" "C3-master"

git checkout -b branch2
append_and_commit "C4 in branch2; the same line of text will be edited in C5 in master" "C4-branch2"

git checkout master
append_and_commit "C5 in master; the same line of text was edited in C4 in branch2" "C5-master"

echo "$0 completed!"
