#!/bin/sh
set -e

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        # shellcheck source=/dev/null
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xrdb -load "$XDG_CONFIG_HOME/X/.Xresources"

setxkbmap gb
xmodmap "$XDG_CONFIG_HOME/X/.Xmodmap"

for f in "$XDG_CONFIG_HOME"/*/xbindkeysrc; do
    xbindkeys --file "$f"
done

ibus-daemon --daemonize --replace --xim

numlockx &

feh --bg-scale "$XDG_CONFIG_HOME/X/bg.png"
exec i3
