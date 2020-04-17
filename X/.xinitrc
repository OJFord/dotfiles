#!/bin/sh
set -e

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        # shellcheck source=/dev/null
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

setxkbmap -layout us

xrdb -load "$XDG_CONFIG_HOME/X/.Xresources"
xmodmap "$XDG_CONFIG_HOME/X/.Xmodmap"
xbindkeys -f "$XDG_CONFIG_HOME/X/.xbindkeysrc"

exec i3
