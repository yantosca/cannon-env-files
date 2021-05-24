#------------------------------------------------------------------------------
#                  GEOS-Chem Global Chemical Transport Model                  !
#------------------------------------------------------------------------------
#BOP
#
# !MODULE: .bash_aliases
#
# !DESCRIPTION: A .bashrc-style file that you can use to contain your own
#  personal settings for the Cannon cluster.
#\\
#\\
# !CALLING SEQUENCE:
#  source ~/.bash_aliases
#  (will also be called each time you source ~/.bashrc)
#
# !REMARKS:
#  The .bashrc file contains settings that are common to all users of
#  GEOS-Chem.  But here you can add settings that would only be applicable
#  to your own environment.
#EOP
#------------------------------------------------------------------------------
#BOC

#==============================================================================
# %%%%% Personal settings: Look-and-feel %%%%%
#==============================================================================

# Settings for colorization
export GREP_COLOR=32

if [[ "x${TERM}" == "xdumb" || "x${TERM}" == "xeterm-color" ]]; then

    #--------------------------------------------------------------------------
    # Prompt and color settings for Emacs terminals
    # These look better against the default background color "Gray75"
    #--------------------------------------------------------------------------
    
    # Override the system prompt (35 = purple)
    PS1="\[\e[1;31m\][\h \W]$\[\e[0m\] "
    
    # Colors for directory listing
    # See: http://www.bigsoft.co.uk/blog/2008/04/11/configuring-ls_colors
    export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;35:*.tar=01;37;44:*.tgz=01;37;44:*.arj=01;37;44:*.taz=01;37;44:*.lzh=01;37;44:*.zip=01;37;44:*.z=01;37;44:*.Z=01;37;44:*.gz=01;37;44:*.bz2=01;37;44:*.deb=01;37;44:*.rpm=01;37;44:*.jar=01;37;44:*.jpg=01;37;44:*.jpeg=01;37;44:*.gif=01;37;44:*.bmp=01;37;44:*.pbm=01;37;44:*.pgm=01;37;44:*.ppm=01;37;44:*.tga=01;37;44:*.xbm=01;37;44:*.xpm=01;37;44:*.tif=01;37;44:*.tiff=01;37;44:*.png=01;37;44:*.mov=01;37;44:*.mpg=01;37;44:*.mpeg=01;37;44:*.avi=01;37;44:*.fli=01;37;44:*.gl=01;37;44:*.dl=01;37;44:*.xcf=01;37;44:*.xwd=01;37;44:*.flac=01;37;44:*.mp3=01;37;44:*.mpc=01;37;44:*.ogg=01;37;44:*.wav=01;37;44:'

else

    #--------------------------------------------------------------------------
    # Prompt and color settings for Xterm
    # These look better against the default background color "DarkSlateGray"
    #--------------------------------------------------------------------------
    
    # Override the system prompt (32 = green)
    PS1="\[\e[1;32m\][\h \W]$\[\e[0m\] "

    # Colors for directory listing
    # See: http://www.bigsoft.co.uk/blog/2008/04/11/configuring-ls_colors
    export LS_COLORS='no=00:fi=00:di=01;33:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;37:*.tgz=01;37:*.arj=01;37:*.taz=01;37:*.lzh=01;37:*.zip=01;37:*.z=01;37:*.Z=01;37:*.gz=01;37:*.bz2=01;37:*.deb=01;37:*.rpm=01;37:*.jar=01;37:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.flac=01;35:*.mp3=01;35:*.mpc=01;35:*.ogg=01;35:*.wav=01;35:'

fi
    
#==============================================================================
# %%%%% Personal settings: Basic Unix commands %%%%%
#==============================================================================

# General Unix commands
alias disk="du -h -s -c"
alias g="grep -in --color=auto"
alias gt="grep -in --text"
alias m="less -CR"
alias me="xterm 2>/dev/null &"
alias proc="ps -ef | grep $USER | sort"
alias pu="rm *~"
alias pua="rm .*~"
alias sb=". ~/.bashrc"
alias sba=". ~/.bash_aliases"
alias tf="tail --follow"
alias zap="kill -9"
alias cd="cd -P"
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

# Tmux aliases
alias tmuxnew="tmux new -s "
alias tmuxat="tmux a -t "
alias tmuxde="tmux detach "

# Convert a windows file to Unix
function dos2unix() {
  awk '{ sub("\r$", ""); print }' $1 > $2
}

#==============================================================================
# %%%%% Personal settings: Git commands %%%%%
#==============================================================================

# Aliases for Git commands
source /etc/bash_completion.d/git    # enable tab-completion
alias clone_gcc="git clone git@github.com:geoschem/GCClassic.git"
alias clone_gchp="git clone git@github.com:geoschem/gchp.git"
alias clone_hco="git clone git@github.com:geoschem/hemco.git"
alias getenv="cd ~/env; git pull origin master"
alias gitc="git -C CodeDir"
alias gl="git log"
alias glo="git log --oneline"
alias glog="git -C src/GEOS-Chem log --oneline "
alias gplog="git -C src/GCHP_GridComp/GEOSChem_GridComp/geos-chem log --oneline "
alias glp="git log --pretty=format:'%h : %s' --topo-order --graph"
alias gk="gitk 2>/dev/null &"
alias gka="gitk --all 2>/dev/null &"
alias gpo="git pull origin"
alias gui="git gui 2>/dev/null &"
alias gsu="git submodule update --init --recursive"
alias hlog="git -C src/HEMCO log --oneline "
alias hplog="git -C src/GCHP_GridComp/HEMCO_GridComp/HEMCO log --oneline "
alias update_tags="git tag -l | xargs git tag -d && git fetch -t"

function gcc2gc() {
    ##### Navigate from GCClassic src/GEOS-Chem dir #####
    if [[ -d ./CodeDir ]]; then 
	cd CodeDir/src/GEOS-Chem
    else
	cd src/GEOS-Chem
    fi
}

function gc2gcc() {
    ##### Navigate from src/GEOS-Chem to GCClassic #####
    if [[ -d ../../../CodeDir ]]; then 
	cd ../../..
    else
	cd ../..
    fi
}

function gchp2gc() {
    ##### Navigate from GCHPctm to geos-chem #####
    if [[ -d ./CodeDir ]]; then 
	cd CodeDir/src/GCHP_GridComp/GEOSChem_GridComp/geos-chem
    else
	cd src/GCHP_GridComp/GEOSChem_GridComp/geos-chem
    fi
}

function gc2gchp() {
    ##### Navigate from geos-chem to GCHPctm #####
    if [[ -d ../../../../CodeDir ]]; then 
	cd ../../../../..
    else
	cd ../../../..
    fi
}

function gbup() {
    ###### Set a branch to follow a remote branch #####
    git branch --set-upstream-to=origin/${1} ${1}
}

function gbrd() {
    ###### Remove remote branches #####
    git branch -r -d origin/$1
}

function gprune() {
    ##### Remove local and remote branches #####
    git branch -d $1
    gbrd $1
}

#==============================================================================
# %%%%% GCST reserved node holyjacob01 %%%%%
#==============================================================================
unset LOCAL_HOME

# Command to ssh into holyjacob01 (visible from all nodes)
alias hj1="ssh -YA holyjacob01"

# Settings that will only be visible from holyjacob01
if [[ "x${HOSTNAME}" == "xholyjacob01.rc.fas.harvard.edu" ]]; then
  export LOCAL_HOME=/local/ryantosca
  alias lh="cd ${LOCAL_HOME}"
  alias lgc="cd ${LOCAL_HOME}/GC"

  # KPP settings on holyjacob01
  export KPP_HOME=/local/ryantosca/GC/KPP/kpp-2.2.3_01
  export KPP_BIN=${KPP_HOME}/bin
  export PATH=${PATH}:${KPP_BIN}
fi

function set_omp() {
    ##### Manually set the number of OpenMP threads #####
    export OMP_NUM_THREADS=${1}
    echo "Number of OpenMP threads: ${OMP_NUM_THREADS}"
}

#==============================================================================
# %%%%% Logins to other machines %%%%%
#==============================================================================
#alias nccs="$HOME/bin/xt -h login.nccs.nasa.gov -u ryantosc &"
alias gcfas="${HOME}/bin/xt -h fas.harvard.edu -u geoschem &"
alias awsgo="ssh -YA -i ~/.ssh/bmy_aws_keypair.pem "
function awsagent() {
  eval $(ssh-agent -s)
  ssh-add ~/.ssh/bmy_aws_keypair.pem
}

#==============================================================================
# %%%%% Data paths on Cannon %%%%%
#==============================================================================
export GCGRID_ROOT="/n/holyscratch01/external_repos/GEOS-CHEM/gcgrid"
export DATA_ROOT="${GCGRID_ROOT}/data"
export EXTDATA="${DATA_ROOT}/ExtData"
export HEMCO_DATA_ROOT="${EXTDATA}/HEMCO"
export FTP_ROOT="${GCGRID_ROOT}/geos-chem"
export VAL_ROOT="${FTP_ROOT}/validation"
export SCRATCH_HOME="${SCRATCH}/jacob_lab/$USER"
alias sh="cd ${SCRATCH_HOME}"
alias sgc="cd ${SCRATCH_HOME}/GC"
alias cd_data="cd $dataDir"

#==============================================================================
# %%%%% netCDF %%%%%
#==============================================================================

# Panoply
alias pan="$HOME/bin/panoply.sh &"

# NetCDF scripts
alias ncpl="nc_chunk.pl"
unset dataDir

#==============================================================================
# %%%%% Tmux %%%%%
#==============================================================================
alias tmuxnew="tmux new -s "
alias tmuxat="tmux a -t "
alias tmuxde="tmux detach"

#==============================================================================
# %%%%% Cmake %%%%%
#==============================================================================

function strip_ignoreeof_from_arg_list() {
    ##### Strip ignoreeof out of an argument list #####
    argv=""
    for arg in "$@"; do
        if [[ "x${arg}" != "xignoreeof" ]]; then
	    argv+="${arg} "
        fi
    done
    echo "${argv}"
}
    
function config_gc_from_rundir() {
    ##### Function to configure GEOS-Chem from the run directory #####

    # Arguments
    argv=$(strip_ignoreeof_from_arg_list $@)
    echo "%%% Arguments: ${argv}"
    
    # Local variables
    thisDir=$(pwd -P)
    buildDir="build"

    # Error check build directory
    if [[ ! -d ${buildDir} ]]; then
	echo "%%% Invalid build directory! %%%"
	cd ${thisDir}
	return 1
    fi

    # Configure the code for type Release
    cd ${buildDir}
    cmake ../CodeDir -DCMAKE_BUILD_TYPE=Release -DRUNDIR=".." ${argv}
    if [[ $? -ne 0 ]]; then
	echo "%%% Failed configuration! %%%"
	cd ${thisDir}
	return 1
    fi

    # Successful return
    echo "%%% Successful configuration: Release! %%%"
    cd ${thisDir}
    return 0
}

function config_gc_debug_from_rundir() {
    ##### Function to configure GEOS-Chem from the run directory #####

    # Arguments
    argv=$(strip_ignoreeof_from_arg_list $@)
    echo "%%% Arguments: ${argv}"
    
    # Local variables
    thisDir=$(pwd -P)
    buildDir="debug"

    # Error check build directory
    if [[ ! -d ${buildDir} ]]; then
	echo "%%% Invalid build directory! %%%"
	cd ${thisDir}
	return 1
    fi

    # Configure the code
    cd ${buildDir}
    cmake ../CodeDir -DCMAKE_BUILD_TYPE=Debug -DRUNDIR=".." ${argv}
    if [[ $? -ne 0 ]]; then
	echo "%%% Failed configuration! %%%"
	cd ${thisDir}
	return 1
    fi

    # Successful return
    echo "%%% Successful configuration: Debug! %%%"
    cd ${thisDir}
    return 0
}

function build_gc() {
    ##### Function to build GEOS-Chem #####

    # Arguments
    buildDir="${1}"

    # Local variables
    thisDir=$(pwd -P)

    # Error checks
    if [[ ! -d ${buildDir} ]]; then
	echo "%%% Invalid directory: ${buildDir} %%%"
	cd ${thisDir}
	return 1
    fi

    # Code compilation
    cd ${buildDir}
    make -j
    if [[ $? -ne 0 ]]; then
	echo "%%% Failed compilation! %%%"
	cd ${thisDir}
	return 1
    fi

    # Code installation
    make -j install
    if [[ $? -ne 0 ]]; then
	echo "%%% Failed Installation! %%%"
	cd ${thisDir}
	return 1
    fi

    # Success 
    echo "%%% Successful Compilation and Installation! %%%"
    cd ${thisDir}
    return 0
}

# Aliases for compiling from the run directory
alias cf="config_gc_from_rundir $@"
alias bu="build_gc build"
alias cfd="config_gc_debug_from_rundir $@"
alias bud="build_gc debug"

#==============================================================================
# %%%%% GEOS-Chem %%%%%
#==============================================================================

# Bob Y's testing: don't turn on netCDF compression, which helps to
# keep file sizes the same, so that they can be diffed in debugging
unset NC_NODEFLATE
export NC_NODEFLATE=y

function set_log_file() {
    ##### Function to define the GEOS-Chem log file #####
    if [[ "x${1}" == "x" ]]; then
      log=GC.log
    else
      log=GC_${1}.log
    fi
    echo ${log}
}

function gctee() {
    ##### GEOS-Chem run, tee to log #####
    log=$(set_log_file "${1}")
    rm -rf ${log}
    ./gcclassic | tee ${log} 2>&1
}

function gcrun() {
    ##### GEOS-Chem run, pipe to log #####
    log=$(set_log_file "${1}")
    rm -rf ${log}
    ./gcclassic > ${log} 2>&1
}

function gcdry() {
    ##### GEOS-Chem dryrun, pipe to log #####
    log=$(set_log_file "DryRun_${1}")
    rm -rf ${log}  
    ./gcclassic --dryrun > ${log}
}

#==============================================================================
# %%%%% Misc stuff %%%%%
#==============================================================================

# Misc aliases
alias rmcore="rm core.*"

function dos2unix() {
    ##### Convert a windows file to Unix #####
    awk '{ sub("\r$", ""); print }' ${1} > temp.txt
    mv temp.txt $1 > /dev/null
}

#==============================================================================
# %%%%% Python settings %%%%%
#==============================================================================

# Select Bob Y's custom environment (matplotlib 3)
alias sab="conda activate bmy"
alias sdb="conda deactivate"

# Add Python repos to $PYTHONPATH
export PYTHONPATH=${PYTHONPATH}:/n/home09/ryantosca/GC/python/gcpy

# Ignore warnings about deprecated options
export PYTHONWARNINGS=ignore::DeprecationWarning

# Settings for Python packages
export PYLINTRC=~/.pylint.rc

# Temporary Python folder (avoids warning messages)
export XDG_RUNTIME_DIR=/tmp/runtime-${USER}
#EOC
