#!/bin/bash

# colors
YELLOW=$'\e[1;33m'
BLUE_BG=$'\e[34;7m'
GREEN_BG=$'\e[32;7m'
GRAY_BG=$'\e[37;7m'
RED_BG=$'\e[31;7m'
RST_CLR=$'\e[;0m' # Reset Color

function log () {
    echo "${YELLOW}* $1${RST_CLR}"
}

function warn () {
    echo "${RED_BG}$1${RST_CLR}"
}

function append () {
    echo $1 >> $2
}

# check if git installed
git --version 2>&1 >/dev/null
isGitInstalled=$?

# prompts    
if [ "$isGitInstalled" = 0 ] ; then
    read -p "Enter git name: " gitConfigName
    read -p "Enter git email: " gitConfigEmail
fi

# ~/bashrc exists? prompt for backup
if [ -e "~/.bashrc" ] ; then
    read -p "Backup ~/.bashrc? [y/n] " bkpBashrc

    # backup current .bashrc
    if [ $bkpBashrc = "y" ] ; then
        log "Backup ~/.bashrc"
        mv ~/.bashrc ~/.bashrc.bkp
    fi
fi

# copy .dotFiles
log "Copy .bashrc"
cp ./home/.bashrc ~/

log "Copy .aliases"
cp ./home/.aliases ~/

log "Copy .git-prompt"
cp ./home/.git-prompt ~/

log "Copy .inputrc"
cp ./home/.inputrc ~/

log "Copy .vimrc"
cp ./home/.vimrc ~/

log "Copy .z"
cp ./home/.z ~/

if [ "$isGitInstalled" = 0 ] ; then
    log "Copy .gitconfig"
    cp ./home/.gitconfig ~/

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

log "source new ~/.bashrc"
source ~/.bashrc

# ag
log "install ag (silversearcher)"
sudo apt-get install silversearcher-ag

echo "${GREEN_BG}Done. Enjoy :]${RST_CLR}"