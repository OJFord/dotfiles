export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export PATH="/usr/local/opt/diffutils/bin:$PATH"
export MANPATH="/usr/local/opt/diffutils/share/man:$MANPATH"

export PATH="/usr/local/opt/findutils/libexec/bin:$PATH"
export MANPATH="/usr/local/opt/findutils/share/man:$MANPATH"

export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/gnu-tar/share/man:$MANPATH"

mac_user_fonts="$HOME/Library/Fonts"
if [ ! -L "$mac_user_fonts" ]; then
    sudo rm -r "$mac_user_fonts"
    ln -s "$XDG_DATA_HOME/fonts" "$mac_user_fonts"
fi

map="$(cat "$XDG_CONFIG_HOME/by-uname/Darwin/userkeymap.json")"
hidutil property --set "$(jq -r -n --argjson map "$map" '{"UserKeyMapping":$map}')" >/dev/null
