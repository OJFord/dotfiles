# shellcheck shell=bash
shopt -s extglob
shopt -s nullglob

if [ "$(uname -s)" != Linux ]; then
    return 0
fi

mkdir -p "$XDG_CONFIG_HOME/systemd/user/sockets.target.wants"
for f in "$XDG_CONFIG_HOME"/*/*[^@].@(service|socket|target); do
    for w in $(sed -En 's/WantedBy=(.+)/\1/p' "$f"); do
        mkdir -p "$XDG_CONFIG_HOME/systemd/user/$w.wants"
    done
    for r in $(sed -En 's/RequiredBy=(.+)/\1/p' "$f"); do
        mkdir -p "$XDG_CONFIG_HOME/systemd/user/$r.requires"
    done

    systemctl --user enable "$(realpath "$f")"
done

# Link but don't enable unit template
for f in "$XDG_CONFIG_HOME"/*/*@.@(service|socket|target); do
    ln -sf "$(realpath "$f")" "$XDG_CONFIG_HOME/systemd/user/"
done
