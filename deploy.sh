#!/bin/bash

cp -v ./home/* ~/

if [ -d ~/.config/Code/User ] ; then
    cp -v -r ./vs-code/* ~/.config/Code/User
else
    echo "vs-code directory is not found: ~/.config/Code/User"
fi

source ~/.bashrc

echo "to install ag search run: $ sudo apt-get install silversearcher-ag"
echo "Don't forget to enter your git user data in ~/.gitconfig"