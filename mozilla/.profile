xdg_moz_dir="$XDG_CONFIG_HOME/mozilla"

if [ "$(uname -s)" = Darwin ]; then
    ln -sf "$xdg_moz_dir/firefox/profiles.ini" "$HOME/Library/Application Support/Firefox/profiles.ini"
    ln -sf "$xdg_moz_dir/firefox/profile" "$HOME/Library/Application Support/Firefox/Profiles/profile"
else
    rm -r "$HOME/.mozilla"
    ln -sf "$xdg_moz_dir" "$HOME/.mozilla"
fi
