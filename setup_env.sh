#!/bin/bash
# A simple bash script that installs things and creates links where I need them 

# VS Code Install 
# Visit https://code.visualstudio.com/docs/setup/mac

# Global vars
u=$USER
z='.zshrc'
v='.vimrc'
p=$(pwd)

# Create dotfile symlinks
# Zsh 
ln -nfs $p/$z /Users/$u/$z

# Vim
ln -nfs $p/$v /Users/$u/$v