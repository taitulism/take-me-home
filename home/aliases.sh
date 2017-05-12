#!/bin/bash

function mkcd () {
    mkdir -pv $1 && cd $1;
}

function hs () {
    if echo $1 | egrep -q '^[0-9]+$'; then
        history $1
    else
        history $2 | grep "$1"
    fi
}

function newShellScript () {
    echo "#!/usr/bin/env bash\n\n" >> "$1".sh
}

alias cd-='cd -'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

alias nsh=newShellScript
alias cls='clear'

alias ls='ls --color=auto -AXF --group-directories-first'
alias lsl='ls -1'
alias ll='ls -AlF --group-directories-first --human-readable'
alias lls='ll | less'

alias rm='rm -I --preserve-root'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias grep='grep --color=auto'

alias debi='sudo dpkg -i'
alias upgrade='sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove'

alias c.='code .'