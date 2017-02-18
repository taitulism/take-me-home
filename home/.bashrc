# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# see http://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html for option details
shopt -s autocd
shopt -s cdspell
shopt -s dirspell
shopt -s checkwinsize
shopt -s dotglob
shopt -s extglob
shopt -s failglob
shopt -s globstar
shopt -s histappend
shopt -s histverify
shopt -s nocaseglob
# shopt -s cdable_var       // set vars for directories (e.g. home=~, repos=~/code/repos)
# shopt -s expand_aliases   // on by default?

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

PS1='\n[\[\033[01;34m\]\w\[\033[00m\]] \$ '

# If this is an xterm set the title
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\w\a\]$PS1"
    ;;
*)
    ;;
esac

# Load aliases
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
