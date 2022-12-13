#!/usr/bin/env zsh

setopt \
    HIST_FCNTL_LOCK \
    HIST_IGNORE_ALL_DUPS \
    HIST_IGNORE_SPACE \
    HIST_REDUCE_BLANKS \
    HIST_SAVE_NO_DUPS \
    NO_BANG_HIST \
    SHARE_HISTORY

mkdir -p ~/.history

HISTSIZE=11000
SAVEHIST=10000
HISTFILE="${HOME}/.history/${HOST%%.*}"
if [[ ${USER} != "odellm" && ${USER} != "modell" && ${USER} != "michael" ]] ; then
    HISTFILE+="-${USER}"
fi

# Don't store any command lines containing JENKINS_PASSWORD to the history file
zshaddhistory()
{
    [[ $1 != *JENKINS_PASSWORD* ]]
}
