#!/bin/bash

. ~/.config/herbstluftwm/icons_config
 # Color directory
CD="$HOME/.Xresources"

font="-xos4-terminesspowerline-medium-r-normal--12-120-72-72-c-60-iso10646-1"
iconfont="-misc-fontawesome-medium-r-normal--12-*-*-*-*-*-iso10646-1"
icons="-xos4-terminusicons2mono-medium-r-normal--12-120-72-72-m-60-iso8859-1"

# Fetch the Colors
BG=$(cat ${CD} | grep -i background | tail -c 8)
FG=$(cat ${CD} | grep -i foreground | tail -c 8)

BLACK=$(cat ${CD} | grep -i color8 | tail -c 8)
RED=$(cat ${CD} | grep -i color9 | tail -c 8)
GREEN=$(cat ${CD} | grep -i color10 | tail -c 8)
YELLOW=$(cat ${CD} | grep -i color11 | tail -c 8)
BLUE=$(cat ${CD} | grep -i color12 | tail -c 8)
MAGENTA=$(cat ${CD} | grep -i color13 | tail -c 8)
CYAN=$(cat ${CD} | grep -i color14 | tail -c 8)
WHITE=$(cat ${CD} | grep -i color15 | tail -c 8)
RESET="%{F-}%{B-}"

WIDHT=$(xrandr | grep "current" | awk '{print $8}')
HEIGHT="14.5"

FONT="-xos4-terminesspowerline-medium-r-normal--12-120-72-72-c-60-iso10646-1"
ICONFONT="-misc-fontawesome-medium-r-normal--12-*-*-*-*-*-iso10646-1"
buf=""

set -f

monitor=${1:-0}
herbstclient pad $monitor 14

function window_icon {
        if [[ "$1" == 'urxvt' ]]; then
                echo -e "\uf120"
        elif [[ "$1" == 'xterm' ]]; then
                echo -e "\uf120"
        elif [[ "$1" == 'chromium' ]]; then
                echo -e "\uf268"
        elif [[ "$1" == 'firefox' ]]; then
                echo -e "\uf269"
        elif [[ "$1" == 'desktop' ]]; then
                echo -e "\uf108"
        elif [[ "$1" == 'nautilus' ]]; then
                echo -e "\uf07b"
        elif [[ "$1" == 'atom' ]]; then
                echo -e "\uf121"
        else
                echo -e "\uf17c"
        fi
}

user(){
        USER=$(whoami)
        echo "${USER}"
}

function timeday {
        case $1 in
                HOUR)
                        timed=$(date | grep -o "[0-9]*:[0-9]*")
                        hour=$(date "+%H")
                        min=$(date "+%M")
                        mdhr=$((10#$hour % 12))
                        mdhr=11
                        part="AM"
                        if [[ "$hour" > 11 ]]; then
                                part="PM"
                        fi
                        if [[ "$mdhr" == 0 ]]; then
                                mdhr=12
                        fi
                        echo -e "$hour:$min $part"
                        ;;
                DATE)
                        DATE=$(date +'%Y-%m-%d')
                        echo "$DATE"
        esac
}

focus(){
        wnd_focus=$(xdotool getwindowfocus)
        wnd_title=$(xprop -id $wnd_focus WM_CLASS | grep -Po "\".*?\"" | head -1 | grep -Po "[^\"]*" )
        if [[ "$wnd_title" == '' ]]; then
                wnd_title='Desktop'
        fi
        echo -e "$(window_icon $wnd_title) $wnd_title"
}


ncmpcpp(){
        status=$(mpc status | grep 'playing\|paused' | awk '{print $1}' | cut -d '[' -f 2 | cut -d ']' -f 1)
        Music=$(mpc current -f '%artist% - %title%')
        if [[ $status == "playing" ]]; then
                echo "%{T2}${icon_music}%{T1} ${Music}"
        elif [[ $status == "paused" ]]; then
                echo "%{T2}${icon_music}%{T1} ${Music} - [paused]"
        else
                echo "%{T2}${icon_arch}%{T1} ArchLinux"
        fi
}

batery (){
        state=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state" | awk '{print $2}')
        if [ $state == "fully-charged" ]; then
                status="Fully"
        elif [ $state == "charging" ]; then 
                status="Charging"
        else
                status="%{F#FF0000}Discharging%{F-}"
        fi
        batery=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "percentage" | awk '{print $2}')
        echo "%{T2}${icon_bat}%{T1} ${batery} ${status}"
}

updates(){
        updates=$(checkupdates | wc -l)
        if [[ $updates -gt "1" ]]; then
                echo $updates
        fi
}
cpu (){
        case $1 in
                MEM)
                        mem=$(free -m | grep Mem: | awk '{printf $2 "/" $3 "Mb"}')
                        echo "%{T2}${icon_mem}%{T1} ${mem}"
                        ;;
                TEMP)
                        temp=$(echo "scale=1; " `cat /sys/class/thermal/thermal_zone0/temp` "/1000" | bc)
                        echo "${temp}°C"
                        ;;
        esac
}

drives (){
        disk=$( df -h| grep 'Filesystem\|/home*' | awk '{printf $2 "/" $4}')
        echo "%{T2}${icon_home}%{T1} ${disk} "
}

vol (){
        status=$(amixer get Master | grep 'Front Left:' | awk '{print $6}' | cut -d '[' -f 2 | cut -d ']' -f 1 | cut -d '%' -f 1)
        vol=$(amixer get Master | grep 'Front Left:' | awk '{print $5}' | cut -d '[' -f 2 | cut -d ']' -f 1 | cut -d '%' -f 1)
        if [[ $status == "on" ]]; then
                echo "%{T2}${icon_vol}%{T1} ${vol}%"
        else
                echo "%{T2}${icon_vol}%{T1} Muted"
        fi
}

## Create bar
while :; do
        echo "%{l}%{B#FFB5BD68}%{T2} ${icon_wsp}%{T1}%{B-}%{F#FFB5BD68}" \
                "%{F-}%{F#ffa7a7a7}$(focus)%{T1}" \
                "%{r}" \
                "%{F#FF282A2E}%{F-}%{B#FF282A2E}%{F#FF917154} $(ncmpcpp) " \
                "%{F#FF454a4f}%{F-}%{B#FF454a4f}%{T1} %{F#ffa7a7a7}$(drives) " \
                "%{F#FF454a4f}%{F-}%{B#FF454a4f}%{T1}%{F#ffa7a7a7}$(cpu MEM) " \
                "%{F#FF454a4f}%{F-}%{B#FF454a4f}%{T1}%{F#ffa7a7a7}$(cpu TEMP)" \
                "%{F#FF303030}%{F-}%{B#FF303030}%{T1} %{F#ffa7a7a7}$(batery)" \
                "%{F#FF454a4f}%{F-}%{B#FF454a4f}%{T1} %{F#ffa7a7a7}$(vol)" \
                "%{F#FF25272a}%{F-}%{B#FF25272a} %{F#ffa7a7a7}%{T2}${icon_clock}%{T1} $(timeday DATE) " \
                "%{F#FF25272a}%{F-}%{B#FF25272a}%{F#ffa7a7a7}$(timeday HOUR)" \
                "%{F#FFB5BD68}%{F-}%{F#FF25272a}%{B#FFB5BD68}%{T2}${icon_contact}%{T1}$(user)" \
                "%{F-}%{B-}" || break
        sleep .1
done 2> /dev/null | lemonbar -g ${WIDHT}x${HEIGHT}+0+1060 -B ${BG} -f ${font} -f ${icons} -f ${iconfont} $1
