#!/bin/bash

terminal='xterm -e'
power_list="------------\nLOGOUT\nREBOOT\nSHUTDOWN"

Dmenu="dmenu -p '' -i -b -h 24 -l 12 -w 100 -dim 0.0 -x 650 -y 320 -i -fn 'Droid Serif-8'  -nb '#1D2426' -sb '#BA5E57' -nf '#FFFFFF' -sf '#212121'"

asuh=$(echo -e "$power_list" | eval $Dmenu)

case $asuh in
        *LOGOUTt | ";"i | i";") 
                pkill i3 & ;;
        *REBOOT)
                shutdown -r now & ;;
        *SHUTDOWN)
                shutdown -h now & ;;
esac
