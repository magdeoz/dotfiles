#!/bin/bash

shopt -s nullglob
cd ~/Imágenes/Walls || exit

while true; do
 files=()
 for i in *.jpg *.png; do
  [[ -f $i ]] && files+=("$i")
 done
 range=${#files[@]}

 ((range)) && feh --bg-scale "${files[RANDOM % range]}"
 break
 #sleep 15m
done
