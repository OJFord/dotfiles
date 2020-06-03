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
xmodmap "$XDG_CONFIG_HOME/X/.Xmodmap"
for f in "$XDG_CONFIG_HOME"/*/xbindkeysrc; do
    xbindkeys --file "$f"
done


export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon --daemonize --replace --xim

exec i3
