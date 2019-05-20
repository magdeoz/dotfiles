#!/bin/bash

# backlight brightness controls. use freely
# and adjust sysfs directory if not on toshiba
# $author Brice Burgess @iceburg 

sysfs="/sys/class/backlight/amdgpu_bl0"
max=`cat ${sysfs}/max_brightness`
level=`cat ${sysfs}/brightness`


usage()
{
script=${0##*/}
echo
echo "Invalid usage of ${script}!"
echo "  $1"
echo "----------------"
echo "$script up     : increases brightness"
echo "$script down   : decreases brightness"
echo "$script set #  : sets brightness to # (integer)"
echo "----------------"
echo


exit 1
}

set_brightness()
{

level=$1

if [ $level -lt 1 ] ; then
 level=1
elif [ $level -gt $max ] ; then
 level=$max
fi
 
echo $level > $sysfs/brightness 
}

case "$1" in
  up)
    let "level+=1"
    set_brightness $level 
    ;;
  down)
    let "level-=1"
    set_brightness $level 
    ;;
  set)
    if [[ ! $2 =~ ^[[:digit:]]+$ ]]; then
     usage "second argument must be an integer"
    fi

    set_brightness $2
    ;;
  *)
    usage "invalid argument"
esac
