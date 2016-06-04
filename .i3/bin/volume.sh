#!/usr/bin/env zsh

Volume=$(amixer get Master | grep 'Front Left:' | awk '{print $5}' | cut -d '[' -f 2 | cut -d ']' -f 1 | cut -d '%' -f 1)
Status=$(amixer get Master | grep 'Front Left:' | awk '{print $6}' | cut -d '[' -f 2 | cut -d ']' -f 1 )

if [ $Status == off ]; then
        Vol='-m'
else
        if [[ $Volume -gt '100' ]]; then
                Vol='100'
        else
                Vol=$Volume
        fi
fi

# Get Status
volnoti-show $Vol
