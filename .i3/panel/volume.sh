#!/bin/bash

status=$(amixer get Master | grep "Front Left:" | awk '{print $6}')
vol=$(amixer get Master -M | grep -oE -m1 "[[:digit:]]*%")

if [ $status == "[on]" ]; then
        if [ $vol == "0%" ]; then
                echo "Muted [$vol]"
        else
                echo "Vol: $vol"
        fi
else
        echo "Muted [$vol]"
fi
