#!/bin/bash

terminal='xterm -e'
power_list="LOGOUT\nREBOOT\nSHUTDOWN"

bg=$(xrdb -query | grep background: | grep -oE '#[a-zA-Z0-9]{6}' | cut -c 1- )
fg=$(xrdb -query | grep foreground: | grep -oE '#[a-zA-Z0-9]{6}' | cut -c 1- )
nf=$(xrdb -query | grep color5: | grep -oE '#[a-zA-Z0-9]{6}' | cut -c 1- )

Dmenu="dmenu -i -b -h 24 -l 12 -w 100 -dim 0.0 -x 650 -y 320 -i -fn 'Droid Serif-8'  -nb '$bg' -sb '$bg' -nf '$fg' -sf '$nf' "

asuh=$(echo -e "$power_list" | eval $Dmenu)

case $asuh in
        *LOGOUTt | ";"i | i";") 
                pkill x & ;;
        *REBOOT)
                shutdown -r now & ;;
        *SHUTDOWN)
                shutdown -h now & ;;
esac
