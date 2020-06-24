xdg_moz_dir="$XDG_CONFIG_HOME/mozilla"

if [ "$(uname -s)" = Darwin ]; then
    grr_dir="$HOME/Library/Application Support/Firefox"
    rm -r "$grr_dir"
    ln -sf "$xdg_moz_dir/firefox/" "$grr_dir"
else
    rm -r "$HOME/.mozilla"
    ln -sf "$xdg_moz_dir" "$HOME/.mozilla"
fi
