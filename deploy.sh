#!/bin/bash

cp -v ./home/* ~/

if [ -d ~/.config/Code/User ] ; then
    cp -v -r ./vs-code/* ~/.config/Code/User
else
    echo "vs-code directory is not found: ~/.config/Code/User"
fi

source ~/.bashrc

YELLOW=$'\033[1;33m'
RED_BG=$'\e[31;7m'
RST_CLR=$'\033[0m' # Reset Color

echo ""
echo -e "To install 'ag' search run: ${YELLOW}$ sudo apt-get install silversearcher-ag${RST_CLR}"
echo ""
echo -e "${RED_BG}Don't forget to enter your git user data in ~/.gitconfig${RST_CLR}"