#!/bin/bash

#------------------------------------------------------------------------------
#          Harvard University Atmospheric Chemistry Modeling Group            !
#------------------------------------------------------------------------------
#BOP
#
# !MODULE: startup
#
# !DESCRIPTION: Shell script STARTUP launches applications at startup.  
#  STARTUP is meant to be called from the main PuTTY login window on the
#  AS cluster or Odyssey cluster.  This allows you to define a Windows
#  firewall with X11 tunneling.
#\\
#\\
# !CALLING SEQUENCE:
#  startup 1         # Opens 1 xterm window  and an emacs editor
#  startup 2         # Opens 2 xterm windows and an emacs editor
#  ...
#  startup           # Opens 4 xterm windows (default) and an emacs editor
#
# !REMARKS:
#  You also need an .Xdefaults file with xterminal settings (i.e. colors,
#  font sizes, cursor colors, etc.).  We have provided a sample .Xdefaults
#  file in the env/root folder.
#
# !REVISION HISTORY: 
#  01 Oct 2003 - R. Yantosca - Initial version
#  13 Aug 2009 - R. Yantosca - Removed obsolete commands
#  13 Aug 2009 - R. Yantosca - Added ProTeX header
#  05 Mar 2010 - R. Yantosca - Modified for new keys
#  05 Jun 2012 - R. Yantosca - Modified for bmy@bmy.as.harvard.edu
#  21 Jun 2012 - R. Yantosca - Now use xterm instead of xt, since we are
#                              already logged into the same system
#  14 Aug 2012 - R. Yantosca - Now start up 4 login windows
#  16 Oct 2014 - R. Yantosca - Simplify, remove delays
#  05 Aug 2015 - R. Yantosca - The user can now specify the # of xterms to
#                              open via the command line (default=4)
#EOP
#------------------------------------------------------------------------------
#BOC

# Number of xterm windows to open, specified by user (default = 4)
if [ "$#" -eq 1 ]; then
  N_TERMINALS=$1
else
  N_TERMINALS=4
fi

# Open connections to the number of specified Xterm windows
for i in `seq 1 $N_TERMINALS`; do
  xterm &
done

# Open an EMACS editor
emacs &

# Exit normally
exit 0
#EOC
