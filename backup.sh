#!/bin/bash

# Backup files
Files=(".bashrc" ".nanorc" ".profile" ".tmux.conf" ".vimrc" ".Xresources" ".compton.conf")
BACKUPDIR="Backup"

Backup (){
        for file in "${Files[@]}"; do
                if [ ! -d "$BACKUPDIR" ]; then
                        mkdir $BACKUPDIR
                fi
                echo Backup: $file
                cp $file $BACKUPDIR
        done
}

Restore (){
        for file in "${Files[@]}"; do
                Restore
