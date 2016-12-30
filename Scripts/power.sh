#!/bin/bash

terminal='xterm -e'
power_list="LOGOUT\nREBOOT\nSHUTDOWN"

Dmenu="dmenu -i -b -h 24 -l 12 -w 100 -dim 0.0 -x 650 -y 320 -i -fn 'Droid Serif-8'  -nb '#1f1f1f' -sb '#1f1f1f' -nf '#917154' -sf '#BA5E57'"

asuh=$(echo -e "$power_list" | eval $Dmenu)

case $asuh in
        *LOGOUTt | ";"i | i";") 
                pkill i3 & ;;
        *REBOOT)
                shutdown -r now & ;;
        *SHUTDOWN)
                shutdown -h now & ;;
esac



