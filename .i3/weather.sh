#!/bin/sh

METRIC=1  # 0 for F, 1 for C

curl -s http://rss.accuweather.com/rss/liveweather_rss.asp\?metric\=${METRIC}\&locCode\=$1 \
| sed -n '/Currently:/ s/.*: \(.*\): \([0-9]*\)\([CF]\).*/\2°\3 \L\1/p'
