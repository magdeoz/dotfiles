#!/bin/bash - 

FILE=$1

bg=$(grep "*background" $FILE| awk '{print $2}')
fg=$(grep "*foreground" $FILE| awk '{print $2}')

echo "#define bg $bg" >> $FILE.X
echo "#define fg $fg" >> $FILE.X


cat < "$FILE" | grep -E color'[0-9]{1}' | while read -r line;do
        numb=$(echo $line | awk '{print $1}')
        if [ $numb == *color0: ]; then
                hex=$(echo $line | awk '{print $2}')
                echo "#define blk $hex"
        elif [ $numb == *color1: ]; then
                hex=$(echo $line | awk '{print $2}')
                echo "#define red $hex"
        elif [ $numb == *color2: ]; then
                hex=$(echo $line | awk '{print $2}')
                echo "#define grn $hex"
        elif [ $numb == *color3: ]; then
                hex=$(echo $line | awk '{print $2}')
                echo "#define ylw $hex"
        elif [ $numb == *color4: ]; then
                hex=$(echo $line | awk '{print $2}')
                echo "#define blu $hex"
        elif [ $numb == *color5: ]; then
                hex=$(echo $line | awk '{print $2}')
                echo "#define mag $hex"
        elif [ $numb == *color6: ]; then
                hex=$(echo $line | awk '{print $2}')
                echo "#define cyn $hex"
        elif [ $numb == *color7: ]; then
                hex=$(echo $line | awk '{print $2}')
                echo "#define wht $hex"
        elif [ $numb == *color8: ]; then
                hex=$(echo $line | awk '{print $2}')
                echo "#define bblk $hex"
        elif [ $numb == *color9: ]; then
                hex=$(echo $line | awk '{print $2}')
                echo "#define bred $hex"
        elif [ $numb == *color10: ]; then
                hex=$(echo $line | awk '{print $2}')
                echo "#define bgrn $hex"
        elif [ $numb == *color11: ]; then
                hex=$(echo $line | awk '{print $2}')
                echo "#define bylw $hex"
        elif [ $numb == *color12: ]; then
                hex=$(echo $line | awk '{print $2}')
                echo "#define bblu $hex"
        elif [ $numb == *color13: ]; then
                hex=$(echo $line | awk '{print $2}')
                echo "#define bmag $hex"
        elif [ $numb == *color14: ]; then
                hex=$(echo $line | awk '{print $2}')
                echo "#define bcyn $hex"
        elif [ $numb == *color15: ]; then
                hex=$(echo $line | awk '{print $2}')
                echo "#define bwht $hex"
        fi >> $FILE.X
        #echo $color
done
rm $FILE
