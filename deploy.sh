#!/bin/bash

# colors
YELLOW=$'\e[1;33m'
BLUE_BG=$'\e[34;7m'
GREEN_BG=$'\e[32;7m'
GRAY_BG=$'\e[37;7m'
RED_BG=$'\e[31;7m'
RST_CLR=$'\e[;0m' # Reset Color

function log () {
    echo "${GRAY_BG}* $1${RST_CLR}"
}

function warn () {
    echo "${RED_BG}$1${RST_CLR}"
}

function append () {
    echo $1 >> $2
}

# prompts    
read -p "Backup ~/.bashrc? [y/n] " bkpBashrc
read -p "Enter name (for .gitconfig) " gitConfigName
read -p "Enter email (for .gitconfig) " gitConfigEmail

# ~/bashrc exists? prompt for backup
if [ -e ~/.bashrc ] ; then

    # backup current .bashrc
    if [ $bkpBashrc = "y" ] ; then
        log "Backup ~/.bashrc"
        mv ~/.bashrc ~/.bashrc.bkp
    fi
fi

# .dotFiles
# =========
# V - .bashrc
# V - .aliases
#   - .bash-git-prompt
# V - .inputrc
# V - .vimrc
# V - .gitconfig
#   - .z


# copy .dotFiles
log "Copy .bashrc"
cp -v ./home/.bashrc ~/

log "Copy .aliases"
cp -v ./home/.aliases ~/

log "Copy .bash-git-prompt"
cp -v ./home/.bash-git-prompt ~/

log "Copy .inputrc"
cp -v ./home/.inputrc ~/

log "Copy .vimrc"
cp -v ./home/.vimrc ~/

log "Copy .z"
cp -v ./home/.z ~/

# check if git installed
git --version 2>&1 >/dev/null
isGitInstalled=$?

if [ $isGitInstalled -eq 0 ]; then
    log "Copy .gitconfig"
    cp -v ./home/.gitconfig ~/

    # set git name
    if [ ! "$gitConfigName" == "" ] ; then
        git config --global user.name $gitConfigName
    fi

    # set git email
    if [ ! "$gitConfigEmail" == "" ] ; then
        git config --global user.email $gitConfigEmail
    fi
fi

# copy vs-code stuff
if [ -d ~/.config/Code/User ] ; then
    log "Copy vs-code stuff"
    cp -v -r ./vs-code/* ~/.config/Code/User
else
    warn "vs-code directory is not found: ~/.config/Code/User"
fi

log "source the new ~/.bashrc"
source ~/.bashrc

# what's next?
echo ""
log "To install 'ag' search run:${RST_CLR} ${YELLOW}$ sudo apt-get install silversearcher-ag${RST_CLR}"
echo ""
warn "Don't forget to enter your git user data in ~/.gitconfig"