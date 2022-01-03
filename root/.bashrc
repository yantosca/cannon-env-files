#---------------------------------------------------------------u---------------
#          Harvard University Atmospheric Chemistry Modeling Group            !
#------------------------------------------------------------------------------
#BOP
#
# !MODULE: .bashrc
#
# !DESCRIPTION: File containing environment settings for the bash shell on
#  FAS RC's Cannon cluster. Rename this file .bashrc when copying to your
#  home directory.
#\\
#\\
# !CALLING SEQUENCE:
#  source ~/.bashrc
#
# !REMARKS:
#  We have removed the module load commands from this .bashrc.  Here you
#  will only find some basic settings and aliases that are needed for
#  you to run GEOS-Chem.
#
#  This .bashrc will also source your startup file ~/.my_personal_settings
#  to load your own personal preferences for your Unix environment.
#
#  After the .bashrc loads, you can issue one of the following aliased
#  commands, which will source a file that will load modules and
#  the personal settings in your ~/.my_personal_settings file.
#
#    load_gf102: Loads GNU Fortran 10.2.0
#    load_gf93:  Loads GNU Fortran 9.3.0    (Spack-built)
#    load_gf92:  Loads GNU Fortran 9.2.0    (Spack-built)
#    load_gf82:  Loads GNU Fortran 8.2.0
#    load_gf71:  Loads GNU Fortran 7.1.0
#    load_if18:  Loads Intel Fortran 19.0.5
#    load_if18:  Loads Intel Fortran 18.0.5
#    load_if17:  Loads Intel Fortran 17.0.4
#
#  You can copy this file to ~/.bashrc in your root directory and edit
#  as you wish.
#
# !REVISION HISTORY:
#  Change directory to ~/env and type 'gitk' at the prompt to browse
#  revision history.
#EOP
#------------------------------------------------------------------------------
#BOC

#==============================================================================
# %%%%% Source systemwide global definitions from /etc/bashrc %%%%%
#==============================================================================
if [[ -f /etc/bashrc ]]; then
 . /etc/bashrc
fi

#==============================================================================
# %%%%% Unix environment settings %%%%%
#==============================================================================
umask 022                             # Make files world-readable by default
set autolist                          # Turn on list completion
set correct                           #
set color                             #
set colorcat                          #
set filesc                            #
set emacs                             # Use an emacs-style editing interface
set history                           # Turn on history of commands
set ignoreeof                         # Prevent EOF from terminating the shell
ulimit -t unlimited                   # Max out cputime
ulimit -f unlimited                   # Max out filesize
ulimit -d unlimited                   # Max out datasize
ulimit -s unlimited                   # Max out stacksize
ulimit -c unlimited                   # Max out coredumpsize
export TERM=xterm                     # Default terminal
export EDITOR=emacs                   # Default editor (emacs or vim)
export VISUAL=emacs                   # Default editor (emacs or vim)
export GIT_EDITOR=emacs               # Default Git editor (emacs or vim)
export MAIL=/usr/spool/mail/$USER     # Default mail program
mail=$MAIL
PS1="\[\e[1;32m\][\h \W]$\[\e[0m\] "  # Override the default Unix prompt

#==============================================================================
# %%%%% Settings for colorization  %%%%%
#==============================================================================
export GREP_COLOR=32
export LS_COLORS='no=00:fi=00:di=01;33:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;37:*.tgz=01;37:*.arj=01;37:*.taz=01;37:*.lzh=01;37:*.zip=01;37:*.z=01;37:*.Z=01;37:*.gz=01;37:*.bz2=01;37:*.deb=01;37:*.rpm=01;37:*.jar=01;37:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.flac=01;35:*.mp3=01;35:*.mpc=01;35:*.ogg=01;35:*.wav=01;35:'

#==============================================================================
# %%%%% Startup settings for various software packages %%%%%
#==============================================================================

# IDL
export IDL_STARTUP="$HOME/IDL/idl_startup.pro"

# Python
export PYTHONSTTARTUP="$HOME/python/python_startup.py"

# Skip warning messages
alias emacs="emacs 2>/dev/null"
alias evince="evince 2>/dev/null"
alias xterm="xterm 2>/dev/null"

#==============================================================================
# %%%%% SLURM and other Cannon-specific commands %%%%%
#==============================================================================
alias squeue="squeue --format='%.9i %.9P %.8j %.8u %.2t %.10M %.6D %.6C %R'"
alias sq="squeue"
alias qj="squeue -u $USER"
alias qp="squeue -p "
alias qa="sacct -j"
alias qdel="scancel"
alias si="sinfo format='%.11P %.20N %.11T %.6D %.4c %C'"
alias hinfo="sinfo format='%.11P %.20N %.11T %.6D %.4c %C' -p huce_intel"
alias cinfo="sinfo format='%.11P %.20N %.11T %.6D %.4c %C' -p huce_cascade"
alias sinfo="sinfo format='%.11P %.20N %.11T %.6D %.4c %C' -p shared"
alias tinfo="sinfo format='%.11P %.20N %.11T %.6D %.4c %C' -p test"
alias jcheck="lsload | grep -e 'jacob\|Hostname'"
alias myfs="sshare -u $USER -U"
alias jacobfs="sshare -A jacob_lab -a"
alias huce_intel_users="sq -p huce_intel --exact-partition-names"
alias huce_cascade_users="sq -p huce_cascade --exact-partition-names"
alias chkscr="lfs quota -hg jacob_lab $SCRATCH"

#==============================================================================
# %%%%% Aliases for basic Unix commands %%%%%
#==============================================================================

# General Unix commands
alias disk="du -h -s -c"
alias g="grep -in --color=auto"
alias gt="grep -in --text"
alias m="less -R"
alias me="xterm &"
alias proc="ps -ef | grep $USER | sort"
alias pu="rm *~"
alias pua="rm .*~"
alias sb=". ~/.bash_profile"
alias ssh="ssh -X -A"
alias gsh="ssh -xT"
alias tf="tail --follow"
alias zap="kill -9"
alias cdp="cd -P"
alias pwdp="pwd -P"
alias ev="evince" # PDF viewer
alias d="display" # image viewer
alias c="clear"
alias h="history"
alias diff="colordiff"
alias rm="rm -Iv"
alias cp="cp -v"
alias mv="mv -v"

# Directory listing commands
alias ls="ls -CF --time-style=long-iso --color=auto"
alias l1="ls -1"
alias ll="ls -l"
alias llt="ls -lt"
alias lltm="ls -lt | less"
alias la="ls -a"
alias lla="ls -la"
alias llh="ls -lh"

#==============================================================================
# %%%%% Aliases to load modules for different compilers %%%%%
#==============================================================================
alias load_gf112=". ~/env/gcc_cmake.gfortran112_spack.env"
alias load_gf102=". ~/env/gcc_cmake.gfortran102_cannon.env"
alias load_if19=". ~/env/gcc_cmake.ifort19_openmpi_cannon.env"
alias load_if18=". ~/env/gcc_cmake.ifort19_openmpi_cannon.env"

#==============================================================================
# %%%%% Load the user's personal settings and aliases %%%%%
#==============================================================================
if [[ -f ~/.bash_aliases ]]; then
  . ~/.bash_aliases
fi
#EOC

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/net/seasasfs02/srv/export/seasasfs02/share_root/ryantosca/python/bmy/miniconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/net/seasasfs02/srv/export/seasasfs02/share_root/ryantosca/python/bmy/miniconda/etc/profile.d/conda.sh" ]; then
        . "/net/seasasfs02/srv/export/seasasfs02/share_root/ryantosca/python/bmy/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/net/seasasfs02/srv/export/seasasfs02/share_root/ryantosca/python/bmy/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

