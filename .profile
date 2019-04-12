#!/bin/sh
export XDG_CONFIG_HOME="$HOME/.config"
export XINITRC="$XDG_CONFIG_HOME/X/.xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X/.xserverrc"


if [ "$(uname -s)" != Darwin ]; then
    exec startx "$XINITRC"
fi
