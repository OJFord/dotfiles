#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

setxkbmap -layout gb

xrdb -load $XDG_CONFIG_HOME/X/.Xresources
xmodmap $XDG_CONFIG_HOME/X/.Xmodmap
xbindkeys -f $XDG_CONFIG_HOME/X/.xbindkeysrc

dex -a &
exec i3
