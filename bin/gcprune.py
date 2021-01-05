#!/usr/bin/env python

'''
Removes Git branches from GEOS-Chem source code directories.

CALLING SEQUENCE:
  gcpull BRANCH-NAME   # Pulls updates into a specific branch
  gcpull               # Pulls updates from all remote tracking branches

REMARKS:
  (1) Assumes you have Git installed on your system.
  (2) Requires Python 2.6 or higher (i.e. with print() function)

REVISION HISTORY:
  19 Apr 2017 - R. Yantosca - Initial version
  24 Jul 2018 - R. Yantosca - Remove dependence on Python 3
  25 Sep 2018 - R. Yantosca - Update folders on holyjacob01 if logged in there
  12 Feb 2019 - R. Yantosca - Updated for new scratch directory on Odyssey
'''

# Import packages
import os
import sys

'''
Update the list of GEOS-Chem source code folders in which you would like
to receive updates from the remote repository below.
'''

# Get environemnt variables
home = os.getenv("HOME")
scratch = os.getenv("SCRATCH_HOME")
local = os.getenv("LOCAL_HOME")

# List of directories to update
gcdirlist = [os.path.join(home, 'GC', 'Code.Dev'),
             os.path.join(scratch, 'GC', 'Code.Dev'),
             os.path.join(scratch, 'GC', 'Code.UT')]

# If we are on holyjacob01, also update the code directories in $LOCAL_HOME
if local == "/local/ryantosca":
    gcdirlist.append(os.path.join(local, 'GC', 'Code.Dev'))
    gcdirlist.append(os.path.join(local, 'GC', 'Code.Ref'))


def prune_geos_chem_dirs():

    '''
    Method prune_geos_chem_dirs issues the commands to prune unwanted local
    and remote branches from each GEOS-Chem source code directory that 
    is specified by the user.
    '''

    # Number of arguments
    n_args = len(sys.argv)

    # Test the # of arguments
    if n_args != 2:
        raise Exception('Usage: gcprune.py BRANCH-NAME')

    # The branch is the first argument
    branch = sys.argv[1]
    branch = branch.strip()
    
    # Loop over the folders and pull the updates
    for gcdir in gcdirlist:

        # Strip whitespace
        gcdir = gcdir.strip()

        # Create the command to prune local and remote branches
        cmd = 'cd {}; git branch -d {}; git branch -r -d origin/{}'.format(
            gcdir, branch, branch)

        # Execute the command
        print('%%%%% Pruning {} from {} %%%%%'.format(branch, gcdir))
        result = os.system(cmd)
        
if __name__ == '__main__':

    '''
    Script driver.  This section only gets executed if we run
    this script at the Unix command prompt.
    '''

    # Get the updates from the remote Git repository
    prune_geos_chem_dirs()
