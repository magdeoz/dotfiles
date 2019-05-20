#!/bin/bash

# small power menu using rofi, i3, systemd and pm-utils
# (last 3 dependencies are adjustable below)
# tostiheld, 2016

Torbox_command="sudo netctl switch-to wlp2s0-Torbox"
Arris_command="sudo netctl switch-to wlp2s0-ARRIS-DE42-psk"

# you can customise the rofi command all you want ...
rofi_command="rofi -width 15 -hide-scrollbar -bg #586e75 -opacity 100 -padding 10 -lines 2"

options=$'Torbox\nArris'

# ... because the essential options (-dmenu and -p) are added here
eval \$"$(echo "$options" | $rofi_command -dmenu -p "")_command"