#!/bin/sh
ScreenWidth=1366
fg="#efefef"
bg="#343C48"
hg="19"
icons2="FontAwesome:size=10"
icons4="FontAwesome:size=10"
bg_volume="#BA5E57"
font='Droid Serif-8'
WidthInfo=`expr $ScreenWidth / 2 - 130`
WidthVolume=150
X_info=`expr $ScreenWidth - $WidthInfo - $WidthVolume`
X_volume=`expr $ScreenWidth - $WidthVolume`

i3status -c ~/.i3/newbar/statusBar2 | dzen2 -p -ta r -e 'button3=' -fn 'Roboto Mono Light for Powerline Light-8.5' -fg $fg -bg $bg_volume -h $hg -w $WidthVolume -x $X_volume &
i3status -c ~/.i3/newbar/statusBar | dzen2 -p -ta r -e 'button3=' -fn 'Roboto Mono Light for Powerline Light-8.5' -fg $fg -bg $bg -h $hg -w $WidthInfo -x $X_info
## i3status -c ~/.i3/newbar/statusBar | dzen2 -p -ta r -e 'button3=' -fn 'Roboto Mono Light for Powerline Light-8.5' -fg $fg -bg $bg -h $hg -w $WidthInfo -x $X_info