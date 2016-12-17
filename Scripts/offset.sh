#!/bin/bash

terminal='xterm -e'
power_list="-- Suspención --\nON\nOFF"
Dmenu="dmenu -p '' -i -b -h 24 -l 12 -w 100 -dim 0.0 -x 650 -y 320 -i -fn 'Droid Serif-8'  -nb '#1D2426' -sb '#BA5E57' -nf '#FFFFFF' -sf '#212121'"
asuh=$(echo -e "$power_list" | eval $Dmenu)

case $asuh in
        *ON)
                xset -dpms s on &  notify-send "suspencion activada" ;;
        *OFF)
                xset -dpms s off &  notify-send "suspencion desactivada" ;;
esac
