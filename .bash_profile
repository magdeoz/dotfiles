#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
PANEL_FIFO=/tmp/panel-fifo
PANEL_HEIGHT=14
PANEL_FONT="-*-fixed-*-*-*-*-10-*-*-*-*-*-*-*"
PANEL_WM_NAME=bspwm_panel
export PANEL_FIFO PANEL_HEIGHT PANEL_FONT PANEL_WM_NAME
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi

export LIBVA_DRIVER_NAME=radeonsi
export VDPAU_DRIVER=radeonsi
#while true
#do
#    IP=$(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//')
#    export IP
#    sleep  10m;
#done

export PATH="$HOME/.cargo/bin:$PATH"
PATH="$HOME/Scripts:$PATH"
