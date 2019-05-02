export LANG="en_GB.UTF-8"
export LC_CTYPE="en_GB.UTF-8"

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"


export XDG_CONFIG_HOME="$HOME/.config"
for p in "$XDG_CONFIG_HOME"/*/.profile; do
    # shellcheck source=/dev/null
    . "$p"
done


if [ "$(uname -s)" != Darwin ]; then
    exec startx "$XINITRC"
fi
