xdg_moz_dir="$XDG_CONFIG_HOME/mozilla"

if [ "$(uname -s)" = Darwin ]; then
    grr_dir="$HOME/Library/Application Support/Firefox"
    if ! [ -L "$grr_dir" ]; then
        rm -r "$grr_dir"
        ln -s "$xdg_moz_dir/firefox/" "$grr_dir"
    fi
else
    if ! [ -L "$HOME/.mozilla" ]; then
        rm -r "$HOME/.mozilla"
        ln -s "$xdg_moz_dir" "$HOME/.mozilla"
    fi
fi
