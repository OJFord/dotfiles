#!/bin/sh
set -eu

config="$XDG_CONFIG_HOME/alacritty/alacritty.toml"
sed -i 's@/selenized-light.toml@/selenized-dark.toml@' "$config"
