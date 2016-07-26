#!/bin/sh
terminal='xterm -e'
menu_list="FILE\\nNET\nMUSIC\n------------\nLOGOUT\nREBOOT\nSHUTDOWN"

Dmenu="dmenu -p '' -i -b -h 24 -l 12 -w 85 -dim 0.0 -x 650 -y 320 -i -fn 'Droid Serif-8'  -nb '#1D2426' -sb '#BA5E57' -nf '#FFFFFF' -sf '#212121'"

asuh=$(echo -e "$menu_list" | eval $Dmenu)



case $asuh in
  *FILE)
    nautilus ;;
  *NET)
    chromiun ;;
  *MUSIC)
    $terminal ncmpcpp ;; 
   *LOGOUTt | ";"i | i";") 
    pkill i3 & ;;
   *REBOOT)
   shutdown -r now & ;;
  *SHUTDOWN)
   shutdown -h now & ;;

esac
