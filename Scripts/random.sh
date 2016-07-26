#!/bin/sh

if [ -z "$1" ]
then
    curl -s -L https://source.unsplash.com/category/nature/1920x1080 | convert - /tmp/background.png
else
    cp "$1" /tmp/background.png
fi

feh --bg-fill /tmp/background.png
