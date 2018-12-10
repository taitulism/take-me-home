#!/bin/bash

rm -rf ~/take-me-home
cp ~/code/repos/take-me-home/original.bashrc ~
rm ~/.bashrc
mv ~/original.bashrc ~/.bashrc

echo done.
