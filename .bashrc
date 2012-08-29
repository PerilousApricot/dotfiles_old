# My (hopefully) magical bashrc

# Aliases
alias cgit="GIT_DIR=$HOME/.config-git GIT_WORK_TREE=$HOME/. git"

# Functions
melo_set_prompt()
{
    # These import as locals to keep from cluttering things
    source CommonHomeTools/bash/color.sh
    if [ "x" == "x$MELO_TERM_NAME" ]; then
        local TERM_SEQ=""
    else
        local TERM_SEQ="[\[$MELO_TERM_COLOR\]$MELO_TERM_NAME\[$Color_Off\]]"
    fi
    local HOST_COLOR=$BGreen
    case `hostname -f` in
        *.accre.vanderbilt.edu)
            HOST_COLOR=$BRed
            ;;
        *)
            HOST_COLOR="$BCyan$On_IBlue"
            ;;
    esac

    export PS1="[\[$HOST_COLOR\]\h\[$Color_Off\]]$TERM_SEQ \$ "
}

melo_set_prompt

