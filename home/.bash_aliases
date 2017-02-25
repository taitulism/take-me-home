function _mkcd() { mkdir $1 && cd $1; }

function _history() {
    if echo $1 | egrep -q '^[0-9]+$'; then
        history $1
    else
        history $2 | grep "$1"
    fi
}

alias cdh='cd ~'
alias cd-='cd -'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

alias mkdir='mkdir -pv'
alias mkcd=_mkcd

alias cls='clear'
alias hs=_history

alias ls='ls --color=auto -AXF --group-directories-first'
alias ls1='ls -1'
alias ll='ls -AlF --group-directories-first --human-readable'
alias lll='ll | less'

alias rm='rm -I --preserve-root'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

alias upgrade='sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove'
