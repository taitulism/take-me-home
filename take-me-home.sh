#!/bin/bash

function backupFile () {
    filename=$1

    logInfo "- Backup ~/$filename"

    mv ~/$1 $home_TMH_backups_path/$1.bkp
}

# TMH = Take Me Home
# remember current TMH repo path
TMH_repo_path=$PWD
home_TMH_path=$HOME/take-me-home
home_TMH_backups_path=$home_TMH_path/backups

logInfo '- mkdir ~/take-me-home'
mkdir "$home_TMH_path"

logInfo '- mkdir ~/take-me-home/backups'
mkdir "$home_TMH_backups_path"

logInfo '- Clone van-gosh'
git clone git@github.com:taitulism/van-gosh.git $home_TMH_path/van-gosh

logInfo '- Clone z.sh'
git clone git@github.com:rupa/z.git $home_TMH_path/z

source $home_TMH_path/van-gosh/van-go.sh

if [ -L ~/.bashrc ] ; then
    backupFile .bashrc
fi
if [ -L ~/.gitconfig ] ; then
    backupFile .gitconfig
fi

# create symlinks to .dotFiles
logInfo '- Symlink .bashrc'
ln -sTf $PWD/home/.bashrc ~/.bashrc

logInfo '- Symlink .aliases'
ln -sTf $PWD/home/.aliases ~/.aliases

logInfo '- Symlink .git-prompt'
ln -sTf $PWD/home/.git-prompt ~/.git-prompt

logInfo '- Symlink .inputrc'
ln -sTf $PWD/home/.inputrc ~/.inputrc

logInfo '- Symlink .vimrc'
ln -sTf $PWD/home/.vimrc ~/.vimrc

logInfo '- Symlink .gitconfig'
ln -sTf $PWD/home/.gitconfig ~/.gitconfig


# copy vs-code stuff
if [ -d ~/.config/Code/User ] ; then
    logInfo '- Copy vs-code stuff'
    cp -v -r ./vs-code/* ~/.config/Code/User
else
    logWarn 'vs-code directory is not found: ~/.config/Code/User'
fi

logInfo '- source new ~/.bashrc'
source ~/.bashrc

# ag
logInfo '- sudo install ag (silversearcher)'
sudo apt-get install silversearcher-ag

logSuccess 'Done. Enjoy :]'
