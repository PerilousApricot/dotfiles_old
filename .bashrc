# My (hopefully) magical bashrc

# Aliases
alias cgit="GIT_DIR=$HOME/.config-git GIT_WORK_TREE=$HOME/. git"
case `hostname -f` in
    se*.accre.vanderbilt.edu)
        alias cmsset="export SCRAM_ARCH=slc5_amd64_gcc462 ; export USER_CXXFLAGS='-D__USE_XOPEN2K8' ; . /opt/cms/cmsset_default.sh"
        ;;
    vmp*)
        alias cmsset="export SCRAM_ARCH=slc5_amd64_gcc462 ; export CVSROOT=\":gserver:cmssw.cvs.cern.ch:/local/reps/CMSSW\" ; source /gpfs21/grid/grid-app/cmssoft/cms/cmsset_default.sh"
        export OSG_APP=/home/grid-app
        export VO_CMS_SW_DIR=/home/grid-app/cmssoft/cms
        ;;
esac

# variables
export PATH=~/CommonHomeTools/build/git/local/bin:~/CommonHomeTools/vim/bin/:$PATH
export MANPATH=~/CommonHomeTools/build/git/local/man:~/CommonHomeTools/vim/share/man/:$PATH
export CVSROOT=meloam@cmssw.cvs.cern.ch:/local/reps/CMSSW

# Functions
melo_set_prompt()
{
    # These import as locals to keep from cluttering things
    source ~/CommonHomeTools/bash/color.sh
    if [ "x" == "x$MELO_TERM_NAME" ]; then
        local TERM_SEQ=""
    else
        local TERM_SEQ="[\[$MELO_TERM_COLOR\]$MELO_TERM_NAME\[$Color_Off\]]"
    fi
    local HOST_COLOR=$BGreen
    case `hostname -f` in
        *.accre.vanderbilt.edu|vmp*)
            HOST_COLOR=$BRed
            ;;
        *)
            HOST_COLOR="$BCyan$On_IBlue"
            ;;
    esac

    export PS1="[\[$HOST_COLOR\]\h\[$Color_Off\]]$TERM_SEQ \w \$ "
}

melo_set_prompt

