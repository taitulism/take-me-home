#!/bin/bash

# remember current take-me-home repo path
# $path_to_take_me_home=$PWD

# mkdir ~/take-me-home
# cd ~/take-me-home

# git clone z.sh
# copy and rename z.sh stuff
# git clone van-gosh

# cd van-gosh
# source van-gosh

# cd back to take-me-home
# cd $path_to_take_me_home

# use van-gosh colorz and loggers
# symlink vs-code stuff

# colors
# YELLOW=$'\e[1;33m'
ORANGE=$'\e[0;33m'
BLUE_BG=$'\e[34;7m'
GREEN_BG=$'\e[32;7m'
RED_BG=$'\e[31;7m'
RST_CLR=$'\e[;0m' # Reset Color

function log () {
    echo "${ORANGE}* $1${RST_CLR}"
}

function warn () {
    echo "${RED_BG}$1${RST_CLR}"
}

# ~/bashrc exists? prompt for backup
if [ -e "~/.bashrc" ] ; then
    read -p "Backup ~/.bashrc? [y/n] " bkpBashrc

    # backup current .bashrc
    if [ $bkpBashrc = "y" ] ; then
        log "Backup ~/.bashrc"
        mv ~/.bashrc ~/.bashrc.bkp
    fi
fi

# create symlinks to .dotFiles
log "Symlink .bashrc"
ln -sTf $PWD/home/.bashrc ~/.bashrc

log "Symlink .aliases"
ln -sTf $PWD/home/.aliases ~/.aliases

log "Symlink .git-prompt"
ln -sTf $PWD/home/.git-prompt ~/.git-prompt

log "Symlink .inputrc"
ln -sTf $PWD/home/.inputrc ~/.inputrc

log "Symlink .vimrc"
ln -sTf $PWD/home/.vimrc ~/.vimrc

log "Symlink .z"
ln -sTf $PWD/home/.z ~/.z

log "Symlink .gitconfig"
ln -sTf $PWD/home/.gitconfig ~/.gitconfig


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
log "sudo install ag (silversearcher)"
sudo apt-get install silversearcher-ag

echo "${GREEN_BG}Done. Enjoy :]${RST_CLR}"
