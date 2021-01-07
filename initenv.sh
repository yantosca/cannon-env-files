#!/bin/bash

#------------------------------------------------------------------------------
#                  GEOS-Chem Global Chemical Transport Model                  !
#------------------------------------------------------------------------------
#BOP
#
# !MODULE: initenv.sh
#
# !DESCRIPTION: Copies startup files from ~/cannon-env-files to your system.
#\\
#\\
# !CALLING SEQUENCE:
#  cd cannon-env-files
#  ./initenv.sh
#
# !REVISION HISTORY: 
#  Use the gitk browser to view the revision history!
#EOP
#------------------------------------------------------------------------------
#BOC

# Copy files to the home folder
cp -f root/.bashrc       ~
cp -f root/.bash_aliases ~
cp -f root/.bash_profile ~
cp -f root/.gitconfig    ~
cp -f root/.tmux.conf    ~
cp -f root/.Xresources   ~

# Copy emacs init files
if [[ ! -d ~/.emacs.d ]]; then
    mkdir ~/.emacs.d
fi
cp -f root/.emacs.d/*. ~/.emacs.d/

# Copy files to the bin folder
if [[ ! -d ~/bin ]]; then
    mkdir ~/bin
fi
cp -f bin/* ~/bin

# Copy files to the init folder
if [[ ! -d ~/init ]]; then
    mkdir ~/init
fi
cp -f init/* ~/init
#EOC
