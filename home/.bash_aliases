function mkcdir() { mkdir $1 && cd $1; }

alias cdh='cd ~'
alias cd-='cd -'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

alias mkdir='mkdir -pv'
alias mkcd=mkcdir

alias cls='clear'
alias h='history'

alias ls='ls --color=auto -AXF --group-directories-first'
alias ls1='ls -1'
alias ll='ls -AlF --group-directories-first --human-readable'
alias lll='ll|less'

alias rm='rm -I --preserve-root'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'


alias upgrade='sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove'
