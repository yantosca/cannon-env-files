#!/bin/bash

#EOC
#------------------------------------------------------------------------------
#                  GEOS-Chem Global Chemical Transport Model                  !
#------------------------------------------------------------------------------
#BOP
#
# !MODULE: gcpull 
#
# !DESCRIPTION: Convenience script to pull changes from a remote Git repo
#  into several local repositories on disk.
#\\
#\\
# !CALLING SEQUENCE:
#  gcpull BRANCH-NAME
#
# !REMARKS:
#  Edit the directory list manually
#
# !REVISION HISTORY:
#  06 Jan 2015 - R. Yantosca - Initial version
#EOP
#------------------------------------------------------------------------------
#BOC

# Make sure ther
if [[ "$#" -ne 1 ]]; then
  echo "Usage: gcpull BRANCH-NAME"
  exit 1;
fi
 
# Save the current working directory
thisDir=$PWD

# List of code directories (edit manually)
dirList=""
dirList+="$HOME/GC/Code.v11-02 "
dirList+="$HOME/GC/Code.Dev "
dirList+="$HOME/GC/Code.Ref "
dirList+="$REGAL_HOME/GC/Code.Dev "
dirList+="$REGAL_HOME/GC/Code.UT "

# Loop over code directories
for f in $dirList;
do

  # Make sure the directory is valid
  if [[ -d $f ]]; then 

     # Change to each directory
     echo "Getting changes from $1 branch into $f"
     cd $f
  
     # Checkout the local branch
     git checkout $1

     # Pull changes from the remote branch into the local branch
     git pull origin $1

  fi

done


# Return to the same directory we started from
cd $thisDir

# Exit normally
exit 0;
#EOC