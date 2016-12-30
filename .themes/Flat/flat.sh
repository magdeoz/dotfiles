#! /bin/bash

source ~/.themes/Functions/panel_functions

while :; do
        echo "" \
                "%{S1}%{l}%{F#ff917154}  $(focus)" \
                "%{c}        $(ws) " \
                "%{r} $(ncmpcpp) |" \
                "$(printf '%b' "\uf1eb") $(net) |" \
                "$(drives) |" \
                "$(volume) |" \
                "$(batery) |" \
                "%{F#ff917154}$(printf '%b' "\uf017") $(timeday DATE) | $(timeday HOUR) " \
                "%{F-}%{B-}" || break
        sleep .1
done 2> /dev/null | lemonbar \
        -g 1343x24+11+5 \
        -B ${BG} \
        -f ${font} \
        -f ${FONT2} \
        -f ${icons} \
        -f ${iconfont} \
        $1
