#!/bin/bash
# A simple bash script that installs things and creates links where I need them 

# VS Code Install 
# Visit https://code.visualstudio.com/docs/setup/mac

# Global vars
u=$USER
p=$(pwd)

## Create dotfile symlinks ##

## Listing out the current files ##
files=`sudo ls | grep -v '\.md$' | grep -v '\.sh$' | grep -v '\.git$'`

function link_files () {
    ln -nfs $1/$2 /Users/$1/$2
}

for entry in $files
do
    echo $entry
    link_files $u $entry
done