# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# see https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html for option details
shopt -s autocd        # do: "mydir" instead of "cd mydir"
shopt -s cdspell       # auto fixes minor typos in directory names when cd
shopt -s checkwinsize  # auto check & fix window size after each command
shopt -s dotglob       # include .dotFiles when globbing
shopt -s extglob       # extend glob matching (e.g. "ls abc*efg.txt")
shopt -s globstar      # enable glob ** to match all files and directories. use **/ to match only directories
shopt -s histappend    # when shell exits, append to history file instead of overwriting it
shopt -s histverify    # when selecting a command from history with "!", don't auto run it
# shopt -s cdable_var  # set global vars for directories (e.g. cd repos = cd ~/code/repos)
# shopt -s dirspell    # auto fixes minor typos in directory names
# shopt -s nocaseglob  # case InSeNsItIvE file expansion

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# use bash-git-prompt to show git branch status in the command prompt (PS1)
if [ -e $HOME/.bash-git-prompt ] ; then
    . $HOME/.bash-git-prompt
else
    echo ".bash-git-prompt file is missing"
    PS1='\n[\[\033[01;34m\]\w\[\033[00m\]] \$ '
fi

# set terminal title
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\w\a\]$PS1"
    ;;
*)
    ;;
esac

# load aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
