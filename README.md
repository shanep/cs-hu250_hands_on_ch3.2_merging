# Ch3.2
# Exercise: Basic Branching and (Fast-Forward and Recursive) Merging

## Step 1
Familiarize yourself with the repository by checking the repository history, file structure, file contents, etc.

## Step 2
Read and understand the contents of the `./chaos_monkey1.sh` script.

## Step 3
Run the `./chaos_monkey1.sh` script.

## Step 4
View the branch and commit history of the repository using:
```bash
$ git log --oneline --decorate --graph --all
```

## Step 5
The output of the command at `Step 4` indicated that `branch1` is currently checked out, and that is "ahead" of `master` by one commit.

Examine the content of the `index.html` at this branch.

## Step 6
Checkout the `master` branch.

View the branch and commit history of the repository (see `Step 4`). The output should indicate that `master` is the checked out branch.

Examine the content of the `index.html` file.

## Step 7
Merge branch `branch1` into `master` (which will result in a "fast-forward" merge) using:
```bash
$ git merge branch1
```

## Step 8
View the branch and commit history of the repository (see `Step 4`), and examine the content of the `index.html` file.

## Step 9
Read and understand the contents of the `./chaos_monkey2.sh` script.

## Step 10
Run the `./chaos_monkey2.sh` script.

## Step 11
View the branch and commit history of the repository (see `Step 4`).

## Step 12
Examine the changes made in the last commit of the `branch2` and `master` branches using:
```bash
$ git show branch2
$ git show master
```
These commands are very similar to the `git log -p` command, but target a very specific commit. In our case, they target the last commit in `branch2` and the last commit in `master`, respectively.

## Step 13
To see the entire content of the `index.html` file in the different branches use the following commands:
```bash
$ git show branch2:index.html
$ git show master:index.html
```
These commands will be introduced later in the book, but for now, think of them as a shortcut to:
```bash
$ git checkout branch2
$ cat index.html
$ git checkout master
$ cat index.html
```

## Step 14
Ensure that `master` is the current checked out branch.

Use the following command to start merging branch `branch2` into `master`, which will result in a merge conflict, because both branches modified the same line of text:
```bash
$ git merge branch2
```

## Step 15
Issue the following command to see more details about the merge conflict:
```bash
$ git status
```
Notice that the `index.html` file is listed as having merge conflicts.

## Step 16
In your favorite text editor, manually edit `index.html` to remove the merge conflict indicators (i.e., the `<<<<<<< HEAD`, `=======` and `>>>>>>> branch2` lines). Optionally, you can make additional changes to the file if needed.

For example, the content of `index.html` after the merge conflicts were manually edited, could look like this:
```text
C1-master
C2 in branch1; when this branch will be merged into master it will be a fast-forward merge
C3 in master
C5 in master; the same line of text was edited in C4 in branch2
C4 in branch2; the same line of text will be edited in C5 in master
```

or could even look like this (notice that the lines `C4...` and `C5...` were switched and altered):
```text
C1-master
C2 in branch1; when this branch will be merged into master it will be a fast-forward merge
C3 in master
C4 in branch2
C5 in master
```

## Step 17
After editing and saving the `index.html` file, mark it as resolved by adding it to the index. Run the following commands to see the status before/after marking the file as resolved:
```bash
$ git status
$ git add index.html
$ git status
```
Notice how the status output provides useful hints regarding the next steps.

## Step 18
Let's use the advice from the last status output and finalize the merge using:
```bash
$ git commit
```
This command will open an editor and prompt you to enter a commit message for the newly created merge commit. The default commit message will be similar to `Merge branch 'branch2'`.

## Step 19
View the branch and commit history of the repository (see `Step 4`) and observe the newly created merge commit.

Examine the content of the `index.html` file in order to see the result of the merge.
