#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xset fp+ $HOME/.fonts
xset fp+ $HOME/.fonts/misc
xset fp+ $HOME/.fonts/terminesspowerline
xset fp rehash

#color temperature
#redshift -l 54.35:18.65 -m randr -t 5500:4500 -g 0.75:0.75:0.7 &
redshift -o -l 0:0 -b 0.8 -t 3900:3900 &
# composite manager
compton --config ~/.compton.conf -b
#bash ~/Scripts/batstat &
#mpd daemon 
mpd ~/.mpd/mpd.conf

# Volnoti daemon
volnoti

#Hide mouse cursor
unclutter -root -visible &

#exec i3
#exec herbstluftwm
exec bspwm
#exec awesome
#xbindkeys
#exec openbox-session
#exec xmonad
#exec way-cooler3exec gnome-session
