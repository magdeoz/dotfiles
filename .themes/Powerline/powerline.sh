#! /bin/bash

source $(dirname $0)/panel_functions

## Create bar
while :; do
        echo "%{}%{B#FFB5BD68}%{T2} ${icon_wsp}%{T1}%{B-}%{F#FFB5BD68}" \
                "%{F-}%{F#ffa7a7a7}$(focus)%{T1}" \
                "%{r}" \
                "%{F#FF282A2E}%{F-}%{B#FF282A2E}%{F#FF917154} $(ncmpcpp) " \
                "%{F#FF454a4f}%{F-}%{B#FF454a4f}%{T1} %{F#ffa7a7a7}$(drives) " \
                "%{F#FF454a4f}%{F-}%{B#FF454a4f}%{T1}%{F#ffa7a7a7}$(cpu MEM) " \
                "%{s2}%{F#FF454a4f}%{F-}%{B#FF454a4f}%{T1}%{F#ffa7a7a7}$(cpu TEMP)" \
                "%{F#FF303030}%{F-}%{B#FF303030}%{T1} %{F#ffa7a7a7}$(batery)" \
                "%{F#FF454a4f}%{F-}%{B#FF454a4f}%{T1} %{F#ffa7a7a7}$(vol)" \
                "%{F#FF25272a}%{F-}%{B#FF25272a} %{F#ffa7a7a7}%{T2}${icon_clock}%{T1} $(timeday DATE) " \
                "%{F#FF25272a}%{F-}%{B#FF25272a}%{F#ffa7a7a7}$(timeday HOUR)" \
                "%{F#FFB5BD68}%{F-}%{F#FF25272a}%{B#FFB5BD68}%{T2}${icon_contact}%{T1}$(user)" \
                "%{F-}%{B-}" || break
        sleep .1
done 2> /dev/null | lemonbar \
        -g ${WIDHT}x${HEIGHT}+0+1060 \
        -B ${BG} \
        -f ${font} \
        -f ${icons} \
        -f ${iconfont} \
        $1
