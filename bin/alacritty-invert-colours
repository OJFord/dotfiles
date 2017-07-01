#!/bin/sh
set -e

config="$XDG_CONFIG_HOME/alacritty/alacritty.yml"

switch_colours() {
    sed -i "s/$1/__TMP__/g ; s/$2/$1/g ; s/__TMP__/$2/g" "$config"
}

switch_colours foreground background
switch_colours white black
switch_colours cyan red
switch_colours magenta green
switch_colours blue yellow
