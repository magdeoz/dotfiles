#!/bin/sh

fg="#efefef"
bg_info="#252525"
bg_time="#BA5E57"

i3status -c ~/.i3/newbar/statusBar2 | dzen2 -p -ta c -e 'button3=' -fn 'Roboto Mono Light for Powerline Light-8' -fg $fg -bg $bg_time -h 18 -w 150 -x 1215 &
i3status -c ~/.i3/newbar/statusBar | dzen2 -p -ta c -e 'button3=' -fn 'Roboto Mono Light for Powerline Light-8' -fg $fg -bg $bg_info -h 18 -w 640 -x 350 &
sh ~/.i3/newbar/conky.sh | dzen2 -p -ta c -e 'button3=' -fn 'Roboto Mono Light for Powerline Light-8' -fg $fg -bg $bg_info -h 18 -w 240 -x 977
