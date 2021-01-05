#------------------------------------------------------------------------------
#          Harvard University Atmospheric Chemistry Modeling Group            !
#------------------------------------------------------------------------------
#BOP
#
# !MODULE: .bash_profile
#
# !DESCRIPTION: Startup file for the bash shell.
#\\
#\\
# !CALLING SEQUENCE:
#  source ~/.bash_profile
#
# !REMARKS:
#  This file just sources the .bashrc file.
#
# !REVISION HISTORY:
#  14 Oct 2014 - R. Yantosca - Initial version
#EOP
#------------------------------------------------------------------------------
#BOC

# Source the .bashrc file if it exists
if [ -f ~/.bashrc ]; then
   . ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/bin
export PATH
#EOC
