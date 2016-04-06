# My i3 Configuration 


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/magdeoz/i3-arch-config/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

## Screenshot Desk:
![](https://raw.githubusercontent.com/magdeoz/i3-Arch-config/master/screen/2016-03-18-171115_1366x768_scrot.png)

## terminal
![](https://raw.githubusercontent.com/magdeoz/i3-Arch-config/master/screen/2016-04-06-184619_1366x768_scrot.png)

## Dependencies

*Note: I might forget something here. Open a ticket if you believe that
something is missing*

This setup is intended for **[i3-gaps](https://github.com/Airblader/i3)** by
Airblader. I haven't tested it with regular i3-- you'll probably have to make
a few changes if you want to use that. I've only ever installed it on Arch
Linux-- I can't make any guarantees about its compatibility with other distros.

* `compton` -- Compositor (GPU acceleration for X, shadows, fades, all kinds
   spiffiness)
* `conky` -- System monitor, provides network, memory, and CPU usage info to
  statusbar
* `feh` -- Wallpaper-setting program and minimalist image viewer
* `mpc` -- Client for `mpd`, responsible for telling lemonbar about the currently
  playing media.
* `mpd` --
  [Music Player Daemon](https://wiki.archlinux.org/index.php/Music_Player_Daemon#Setup).
  Plays beautiful music for your face. I recommend
  `ncmpcpp` as a terminal client for it.
* `iwconfig` -- Wireless interface configuration tool, used only for `wifimode`
* [Powerline](http://powerline.readthedocs.org/en/master/) -- Statusline framework
  with many plugins. Needed for `fish`, and shell styling.
* [Powerline Fonts](https://github.com/powerline/fonts) -- For the arrows and such.
* [Siji Icon Font](https://github.com/gstk/siji) -- Wonderful icon font, I use it
  for lemonbar.
* `pulseaudio` -- If you don't use / like pulseaudio, that's okay. You'll just have
  to do a little work yourself to get the volume scripts, media key bindings,
  and shell aliases to work for whatever setup you have.
* `python3` -- For `applyxres`. You probably already have it.
* `ranger` -- Terminal file browser. Used in `bkg` script to easily browse
  images.
* `xprop` -- X11 window info program, makes the window title section work.
