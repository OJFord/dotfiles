PATH="$(find -L /usr/local/opt -name gnubin -print0 | xargs -0 -I@ printf '@:')$PATH"
export PATH
MANPATH="$(find -L /usr/local/opt -name gnuman -print0 | xargs -0 -I@ printf '@:')$MANPATH"
export MANPATH

export PATH="/usr/local/opt/diffutils/bin:$PATH"
export MANPATH="/usr/local/opt/diffutils/share/man:$MANPATH"

export PATH="/usr/local/opt/findutils/libexec/bin:$PATH"
export MANPATH="/usr/local/opt/findutils/share/man:$MANPATH"

mac_user_fonts="$HOME/Library/Fonts"
if [ ! -L "$mac_user_fonts" ]; then
    sudo rm -r "$mac_user_fonts"
    ln -s "$XDG_DATA_HOME/fonts" "$mac_user_fonts"
fi

map="$(cat "$XDG_CONFIG_HOME/by-uname/Darwin/userkeymap.json")"
hidutil property --set "$(jq -r -n --argjson map "$map" '{"UserKeyMapping":$map}')" >/dev/null
