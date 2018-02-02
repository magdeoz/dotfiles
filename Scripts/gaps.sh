#!/bin/bash

terminal='xterm -e'
menu_list="------------------\nFOCUS\\nPRETTY\nWORK\n------------------\nBROWSER\nMUSIC\nFILES\n------------------"

Dmenu="dmenu -p '' -i -b -h 24 -l 12 -w 85 -dim 0.0 -x 640 -y 320 -i -fn 'Roboto Mono Light for Powerline Light-8'  -nb '#1D2426' -sb '#BA5E57' -nf '#FFFFFF' -sf '#212121'"
asuh=$(echo -e "$menu_list" | eval $Dmenu)

case $asuh in
  *FOCUS)
    i3 gaps outer current set 3
    i3 gaps inner current set 5
    ;;
  *PRETTY)
    i3 gaps outer current set 54
    i3 gaps inner current set 12
    ;;
  *WORK)
    i3 gaps outer current set 5
    i3 gaps inner current set 10
    ;;
  *BROWSER)
    chromium ;;
  *MUSIC)
    $terminal ncmpcpp ;;
  *FILES)
	nautilus ;;
esac > /dev/null
