#!/bin/sh
sed -e "s/\*color:\ //g" \
 -e 's/bg/*background:/' \
 -e 's/fg/*foreground:/' \
 -e 's/*color0:/blk/' \
 -e 's/*color1:/red/' \
 -e 's/*color2:/grn/' \
 -e 's/*color3:/ylw/' \
 -e 's/*color4:/blu/' \
 -e 's/*color5:/mag/' \
 -e 's/*color6:/cyn/' \
 -e 's/*color7:/wht/' \
 -e 's/*color8:/bblk/' \
 -e 's/*color9:/bred/' \
 -e 's/*color10:/bgrn/' \
 -e 's/*color11:/bylw/' \
 -e 's/*color12:/bblu/' \
 -e 's/*color13:/bmag/' \
 -e 's/*color14:/bcyn/' \
 -e 's/*color15:/bwht/' \
$1