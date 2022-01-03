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
#EOP
#------------------------------------------------------------------------------
#BOC

# Source the .bashrc file if it exists
[[ -f ~/.bashrc ]] && . ~/.bashrc

#EOC
