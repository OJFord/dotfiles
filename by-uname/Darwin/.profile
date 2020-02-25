# shellcheck source=gnu/.profile
. "$XDG_CONFIG_HOME/by-uname/Darwin/gnu/.profile"

export PATH="/usr/local/opt/python/libexec/bin:$PATH"

mac_user_fonts="$HOME/Library/Fonts"
if [ ! -L "$mac_user_fonts" ]; then
    sudo rm -r "$mac_user_fonts"
    ln -s "$XDG_DATA_HOME/fonts" "$mac_user_fonts"
fi

map="$(cat "$XDG_CONFIG_HOME/by-uname/Darwin/userkeymap.json")"
hidutil property --set "$(jq -r -n --argjson map "$map" '{"UserKeyMapping":$map}')" >/dev/null
loginitems add "$XDG_CONFIG_HOME/by-uname/Darwin/prefs.sh"
