#!/usr/bin/env zsh

USAGE="Usage: touchpad.sh On|Off"

declare -i ID
ID=`xinput list | grep -Eio '(touchpad|glidepoint)\s*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}'`

case $argv[1] in
    (On)
        echo "Touchpad enabled."
        notify-send 'Touchpad' 'Enabled' -i /usr/share/icons/Adwaita/48x48/devices/input-touchpad.png
        xinput enable $ID
        ;;
    (Off)
        echo "Touchpad disabled."
        notify-send 'Touchpad' 'Disabled' -i /usr/share/icons/Adwaita/48x48/devices/input-touchpad.png
        xinput disable $ID
        ;;
    (*)
        echo $USAGE
        ;;
esac
