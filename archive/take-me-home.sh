#!/bin/bash

function backupFile () {
    local filename=$1


    if [ -f $home_TMH_backups_path/$1.bkp ] ; then
        logInfo "* Skipping Backup ~/$filename"
    else
        logInfo "* Backup ~/$filename"
        mv ~/$1 $home_TMH_backups_path/$1.bkp
    fi
}

# TMH = Take Me Home
home_TMH_path=$HOME/take-me-home
home_TMH_backups_path=$home_TMH_path/backups

mkdir "$home_TMH_path"
mkdir "$home_TMH_backups_path"

bold_steel_blue="\e[1;38;5;69m"
no_color="\e[0m"

# Clone Van-Gosh
echo -e "${bold_steel_blue}* Clone van-gosh${no_color}"
git clone https://github.com:taitulism/van-gosh.git $home_TMH_path/van-gosh

# Clone z.sh
echo -e "${bold_steel_blue}* Clone z.sh${no_color}"
git clone https://github.com:rupa/z.git $home_TMH_path/z

unset bold_steel_blue
unset no_color


# Van-Gosh
source $home_TMH_path/van-gosh/van-go.sh


# backup stuff
if [ -L ~/.bashrc ] ; then
    backupFile .bashrc
fi
if [ -L ~/.gitconfig ] ; then
    backupFile .gitconfig
fi


# create symlinks
logInfo '* Symlink .bashrc'
ln -sTf $PWD/home/.bashrc ~/.bashrc

logInfo '* Symlink aliases.sh'
ln -sTf $PWD/home/aliases.sh $home_TMH_path/aliases.sh

logInfo '* Symlink git-prompt.sh'
ln -sTf $PWD/home/git-prompt.sh $home_TMH_path/git-prompt.sh

logInfo '* Symlink .inputrc'
ln -sTf $PWD/home/.inputrc ~/.inputrc

logInfo '* Symlink .vimrc'
ln -sTf $PWD/home/.vimrc ~/.vimrc

logInfo '* Symlink .gitconfig'
ln -sTf $PWD/home/.gitconfig ~/.gitconfig

logInfo '* source new ~/.bashrc'
source ~/.bashrc

# Install ag
logInfo '* sudo install ag (silversearcher)'
sudo apt-get install silversearcher-ag

unset home_TMH_path
unset home_TMH_backups_path
unset backupFile

logSuccess 'Done. Enjoy :]'
