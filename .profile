#!/bin/sh
export XDG_CONFIG_HOME="$HOME/.config"
export XINITRC="$XDG_CONFIG_HOME/X/.xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X/.xserverrc"

export SHELL="xonsh"
export XONSH_CONFIG_DIR="$XDG_CONFIG_HOME/xonsh"
export XONSHCONFIG="$XONSH_CONFIG_DIR/config.json"
export XONSHRC="$XONSH_CONFIG_DIR/.xonshrc"

# !FIXME: get alacritty working (jwilm/alacritty#640)
export TERMINAL="urxvt -e $SHELL"

exec startx $XINITRC