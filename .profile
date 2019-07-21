export LANG="en_GB.UTF-8"
export LC_CTYPE="en_GB.UTF-8"

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
export MANPATH="/usr/local/share/man:/usr/share/man"

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

for p in "$XDG_CONFIG_HOME"/*/.profile; do
    # shellcheck source=/dev/null
    . "$p"
done

if [ "$(uname -s)" != Darwin ]; then
    exec startx "$XINITRC"
fi
