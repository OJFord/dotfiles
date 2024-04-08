# shellcheck source=gnu/.profile
. "$XDG_CONFIG_HOME/by-uname/Darwin/gnu/.profile"

export PATH="$(brew --prefix python)/libexec/bin:$PATH"

mac_user_fonts="$HOME/Library/Fonts"
xdg_fonts="$XDG_DATA_HOME/fonts"
if [ ! -L "$xdg_fonts" ]; then
    # In case we've already installed anything there, move it to FontBook's dir
    if [ -e "$xdg_fonts" ]; then
        mv "$xdg_fonts"/* "$mac_user_fonts"
        rm -r "$xdg_fonts"
    fi

    # Must be this way around, FontBook won't follow symlink unless it ends up in ~/Library/Fonts anyway
    ln -s "$mac_user_fonts" "$xdg_fonts"
fi

# On Linux this is an alias in fontconfig, on macOS it needs to be in FontBook.app
# haven't found a better way of creating an alias than duplicating with another name
if [ ! -e "$mac_user_fonts/monospace-Regular.ttf" ]; then
    python -m venv fontname
    source fontname/bin/activate
    python -m pip install fonttools
    for f in "$mac_user_fonts"/Myosevka-*.ttf; do
        cp "$f" "$(echo "$(basename "$f")" | sed s/Myosevka/monospace/)"
    done
    fontname.py monospace monospace-*.ttf
    false
    mv monospace-*.ttf "$mac_user_fonts"
fi
