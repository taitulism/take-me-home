#!/bin/bash

# TMH = Take Me Home
# remember current TMH repo path
TMH_repo_path=$PWD
home_TMH_path=$HOME/take-me-home

mkdir "$home_TMH_path"

# git clone z.sh
# copy and rename z.sh stuff

# clone van-gosh
git clone git@github.com:taitulism/van-gosh.git $home_TMH_path/van-gosh

# cd van-gosh
echo $home_TMH_path/van-gosh/van-go.sh
source $home_TMH_path/van-gosh/van-go.sh

logFail "success"

# use van-gosh colorz and loggers
# symlink vs-code stuff


# ~/bashrc exists? prompt for backup
if [ -e "~/.bashrc" ] ; then
    read -p "Backup ~/.bashrc? [y/n] " bkpBashrc

    # backup current .bashrc
    if [ $bkpBashrc = "y" ] ; then
        logInfo "Backup ~/.bashrc"
        mv ~/.bashrc ~/.bashrc.bkp
    fi
fi

# create symlinks to .dotFiles
logInfo "Symlink .bashrc"
ln -sTf $PWD/home/.bashrc ~/.bashrc

logInfo "Symlink .aliases"
ln -sTf $PWD/home/.aliases ~/.aliases

logInfo "Symlink .git-prompt"
ln -sTf $PWD/home/.git-prompt ~/.git-prompt

logInfo "Symlink .inputrc"
ln -sTf $PWD/home/.inputrc ~/.inputrc

logInfo "Symlink .vimrc"
ln -sTf $PWD/home/.vimrc ~/.vimrc

logInfo "Symlink .z"
ln -sTf $PWD/home/.z ~/.z

logInfo "Symlink .gitconfig"
ln -sTf $PWD/home/.gitconfig ~/.gitconfig


# copy vs-code stuff
if [ -d ~/.config/Code/User ] ; then
    logInfo "Copy vs-code stuff"
    cp -v -r ./vs-code/* ~/.config/Code/User
else
    logWarn "vs-code directory is not found: ~/.config/Code/User"
fi

logInfo "source new ~/.bashrc"
source ~/.bashrc

# ag
logInfo "sudo install ag (silversearcher)"
sudo apt-get install silversearcher-ag

logSuccess "Done. Enjoy :]"
