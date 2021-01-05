#!/bin/bash

### Script to rename "master" Git branch to "main".

# Move master to main
git branch -m master main

# Push main to remote repo as the upstream
git push -u origin main

# Remove reference to remote master branch
git branch -r -d origin/master

# Remove remote branch
#git branch origin :master

# Make main the default branch
git branch -u origin/main main

# Echo info.  You may still need to make main the default branch.
echo '#######################################################################'
echo "Also check at the remote Github repo site to make sure that"
echo "main is the default branch.  If not, then manually change it there:"
echo "Branches -> Change default branch -> select 'main' -> 'I understand'"
echo '#######################################################################'
