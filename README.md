# My i3 Configuration 


## Screenshot Desk:
![](https://raw.githubusercontent.com/magdeoz/dotfiles/master/screen/Screenshot-20170420112432_1366x768.png)

## terminal
![](https://raw.githubusercontent.com/magdeoz/dotfiles/master/screen/Screenshot-20170420112426_1366x768.png)

## Dependencies

* `compton` -- Compositor (GPU acceleration for X, shadows, fades, all kinds spiffiness)
* `feh` -- Wallpaper-setting program and minimalist image viewer
* `mpc` -- Client for `mpd`, responsible for telling lemonbar about the currently playing media.
* `mpd` -- [Music Player Daemon](https://wiki.archlinux.org/index.php/Music_Player_Daemon#Setup).
* `ncmpcpp` as a terminal client for it.
* `iwconfig` -- Wireless interface configuration tool, used only for `wifimode`
* [Powerline](http://powerline.readthedocs.org/en/master/) -- Statusline framework with many plugins. Needed for `fish`, and shell styling.
* [Powerline Fonts](https://github.com/powerline/fonts) -- For the arrows and such.
* [Siji Icon Font](https://github.com/gstk/siji) -- Wonderful icon font, I use it for lemonbar.
* `pulseaudio` -- If you don't use / like pulseaudio, that's okay. You'll just have to do a little work yourself to get the volume scripts, media key bindings,
  and shell aliases to work for whatever setup you have.
* `python3` -- For `applyxres`. You probably already have it.
* `ranger` -- Terminal file browser. Used in `bkg` script to easily browse images.
* `xprop` -- X11 window info program, makes the window title section work.
