#!/bin/sh
set -eu

alacritty_dir="$XDG_CONFIG_HOME/alacritty"
ln -sf \
    "$XDG_CONFIG_HOME/selenized/terminals/alacritty/selenized-dark.toml" \
    "$alacritty_dir/selenized.toml"
touch "$alacritty_dir/alacritty.toml"
