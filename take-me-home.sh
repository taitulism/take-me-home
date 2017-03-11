#!/bin/bash

function backupFile () {
    local filename=$1

    logInfo "* Backup ~/$filename"

    mv ~/$1 $home_TMH_backups_path/$1.bkp
}

# TMH = Take Me Home
home_TMH_path=$HOME/take-me-home
home_TMH_backups_path=$home_TMH_path/backups

mkdir "$home_TMH_path"
mkdir "$home_TMH_backups_path"

bold_steel_blue="\e[1;38;5;69m"
no_color="\e[0m"
echo -e "${bold_steel_blue}* Clone van-gosh${no_color}"
git clone git@github.com:taitulism/van-gosh.git $home_TMH_path/van-gosh

echo -e "${bold_steel_blue}* Clone z.sh${no_color}"
git clone git@github.com:rupa/z.git $home_TMH_path/z

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


# vs-code stuff
vs_code_User_path=~/.config/Code/User
if [ -d "$vs_code_User_path" ] ; then
    logInfo '* Symlink vs-code stuff'

    # keybindings & settings
    ln -sf $PWD/vs-code/keybindings.json $vs_code_User_path/keybindings.json 
    ln -sf $PWD/vs-code/settings.json $vs_code_User_path/settings.json 

    # create vs-code snippets dir if not exists
    if [ ! -d "$vs_code_User_path/snippets" ] ; then
        mkdir $vs_code_User_path/snippets
    fi

    # snippets
    ln -sf $PWD/vs-code/snippets/html.json $vs_code_User_path/snippets/html.json
    ln -sf $PWD/vs-code/snippets/javascript.json $vs_code_User_path/snippets/javascript.json
else
    logWarn 'vs-code directory is not found: $vs_code_User_path'
fi
unset vs_code_User_path


logInfo '* source new ~/.bashrc'
source ~/.bashrc


logInfo '* sudo install ag (silversearcher)'
sudo apt-get install silversearcher-ag

unset home_TMH_path
unset home_TMH_backups_path
unset backupFile

logSuccess 'Done. Enjoy :]'
