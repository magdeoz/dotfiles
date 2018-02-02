#!/bin/bash
# Color directory
CD="$HOME/.config/termcolours/hybrid_e7"

BG="#252525"
FG="#efefef"
BLACK="#c3c3c3"
GREEN="#2b2b2b"

# Fonts
ICON_FONT="FontAwesome"
PANEL_FONT="Roboto Mono Light for Powerline"


# Panel
PW=400
PH=68
PX=533
PY=372

#icons

echo "%{c}  %{A:p:}Shutdown%{A}  %{A:r:}Reboot%{A}  %{A:s:}Suspend%{A}  %{A:b:}Exit%{A}  " | lemonbar -g ${PW}x${PH}+${PX}+${PY} -f "$ICON_FONT" -f "$PANEL_FONT" -B "$GREEN" -F "$BLACK" -dp | \
    while :; do
        read line
        case $line in
            'b')
                p=$(pgrep -n lemonbar)
                kill $p
                exit
                ;;
            's')
                systemctl suspend &
                p=$(pgrep -n lemonbar)
                kill $p
                exit
                ;;
            'p')
                systemctl poweroff -i
                exit
                ;;
            'r')
                systemctl reboot
                exit
                ;;
        esac
    done
