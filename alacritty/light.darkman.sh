#!/bin/sh
set -eu

config="$XDG_CONFIG_HOME/alacritty/alacritty.toml"
sed -i 's@/selenized-dark.toml@/selenized-light.toml@' "$config"
