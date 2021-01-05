#!/usr/bin/env python

'''
Pulls changes from a remote Git repository into several local GEOS-Chem
source code directories.

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
             os.path.join(scratch, 'GC', 'Code.UT')]

# If we are on holyjacob01, also update the code directories in $LOCAL_HOME
if local == "/local/ryantosca":
    gcdirlist.append(os.path.join(local, 'GC', 'Code.Dev'))
    gcdirlist.append(os.path.join(local, 'GC', 'Code.Ref'))


def pull_geos_chem_updates():

    '''
    Method pullGeosChemUpdates issues the "git pull" commands that
    pull updates from the remote repository into several local
    GEOS-Chem source code folders (defined in the list above)
    '''

    # Number of arguments
    n_args = len(sys.argv)

    # Test the # of arguments
    if n_args == 0 or n_args > 2:
        raise Exception("Usage: gcpull.py BRANCH-NAME")

    # Loop over the folders and pull the updates
    for gcdir in gcdirlist:

        # Strip whitespace
        gcdir = gcdir.strip()

        # 1 argument passed, fetch all remote branches
        if n_args == 1:
            cmd = "cd {}; git fetch".format(gcdir)

        # 2 arguments passed: pull a named branch
        elif n_args == 2:
            cmd = "cd {}; git checkout {}; git pull origin '{}'".format(
                gcdir, sys.argv[1], sys.argv[1])

        # Execute the command
        print("%%%%% Pulling updates into {} %%%%%".format(gcdir))
        result = os.system(cmd)

        # Exit if not successful
        if result != 0:
            msg = "Could not git pull updates into {}!".format(gcdir)
            raise Exception(msg)


if __name__ == '__main__':

    '''
    Script driver.  This section only gets executed if we run
    this script at the Unix command prompt.
    '''

    # Get the updates from the remote Git repository
    pull_geos_chem_updates()
