#!/bin/bash

PKGY=("lemonbar" \
        "bspwm-git" \
        "sxhkd-git" \
        "dmenu2")

PKGO=("ncmpcpp" \
        "mpd" \
        "mpc" \
        "vim" \
        "compton" \
        "feh" \
        "net-tools" \
        "iw" \
        "redshift" \
        "xdotool" )

yaourt(){
        for package in "${PKGY[@]}"; do
                echo Installing: $package
                echo yaourt -S $package
                echo Enjoy!
        done
}

Official(){
        for package in "${PKGO[@]}"; do
                echo Installing: $package
                echo sudo pacman -S $package --noconfirm
                echo Enjoy!
        done
}

Official
yaourt




