export LANG="en_GB.UTF-8"

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
export MANPATH="/usr/local/share/man:/usr/share/man"

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

for p in "$XDG_CONFIG_HOME"/*/.profile; do
    # shellcheck source=/dev/null
    . "$p"
done

for e in "$XDG_CONFIG_HOME"/*/env.conf; do
    set -o allexport
    # shellcheck source=/dev/null
    . "$e"
    set +o allexport

    confdirname="$(basename "$(dirname "$e")")"
    ln -sf "../$confdirname/env.conf" "$XDG_CONFIG_HOME/environment.d/50-$confdirname.profile.conf"
done

cat > "$XDG_CONFIG_HOME/environment.d/00-.profile.conf" <<-EOF
	PATH=$PATH
	XDG_CACHE_HOME=$XDG_CACHE_HOME
	XDG_CONFIG_HOME=$XDG_CONFIG_HOME
	XDG_DATA_HOME=$XDG_DATA_HOME
EOF

if [ "$(uname -s)" = Linux ]; then
    if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
        exec startx "$XINITRC"
    fi
fi
