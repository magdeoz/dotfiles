#!/usr/bin/env zsh

status=$(amixer get Master | grep 'Front Left:' | awk '{print $5}' | cut -d '[' -f 2 | cut -d ']' -f 1 | cut -d '%' -f 1)

if [[ $status -gt '100' ]]; then
         Vol='100'
         echo $Vol
else
         Vol=$status
fi


# Get Status
volnoti-show $Vol
