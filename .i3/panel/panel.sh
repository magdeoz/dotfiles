#!/bin/sh

fg="#efefef"
bg_info="#252525"
bg_time="#BA5E57"

conky -c ~/.i3/panel/conkyrc1 | dzen2 -p -ta c -e 'button3=' -fn 'Roboto Mono Light for Powerline Light-8' -bg '#252525' -h 18 -w 610 -x 370 &
conky -c ~/.i3/panel/conkyrc | dzen2 -p -ta c -e 'button3=' -fn 'Roboto Mono Light for Powerline Light-8' -fg $fg -bg $bg_info -h 18 -w 305 -x 1070

##backup
#i3status -c ~/.i3/panel/i3status2.conf | dzen2 -p -ta c -e 'button3=' -fn 'Roboto Mono Light for Powerline Light-8' -fg $fg -bg $bg_time -h 18 -w 150 -x 1215 &
#conky -c ~/.i3/panel/conkyrc | dzen2 -p -ta c -e 'button3=' -fn 'Roboto Mono Light for Powerline Light-8' -fg $fg -bg '#528588' -h 18 -w 246.5 -x 978 &
#i3status -c ~/.i3/panel/i3status.conf | dzen2 -p -ta c -e 'button3=' -fn 'Roboto Mono Light for Powerline Light-8' -fg $fg -bg $bg_info -h 18 -w 640 -x 350
