#!/bin/sh

terminal='xterm -e'
menu_list="--- Touchpad ---\\nON\nOFF\n----------------------"
Dmenu="dmenu -p '' -i -b -h 24 -l 12 -w 100 -dim 0.0 -x 650 -y 320 -i -fn 'Droid Serif-8'  -nb '#1D2426' -sb '#BA5E57' -nf '#FFFFFF' -sf '#212121'"

declare -i ID
ID=`xinput list | grep -Eio '(touchpad|glidepoint)\s*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}'`

asuh=$(echo -e "$menu_list" | eval $Dmenu)

case $asuh in
        *ON)
                notify-send 'Touchpad' 'Enabled' -i /usr/share/icons/Adwaita/48x48/devices/input-touchpad.png
                xinput enable $ID ;;
        *OFF)
                notify-send 'Touchpad' 'Disabled' -i /usr/share/icons/Adwaita/48x48/devices/input-touchpad.png
                xinput disable $ID ;;
esac
