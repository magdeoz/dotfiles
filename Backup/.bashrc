#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '
PS1=' \e[96m>\e[0m '
#alias python=/usr/local/bin/python2.7
#powerline-daemon -q

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi
export POWERLINE_COMMAND=powerline
. /home/gabriel/.local/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh
