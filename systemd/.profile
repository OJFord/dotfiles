# shellcheck shell=bash
shopt -s extglob

if [ "$(uname -s)" != Linux ]; then
    return 0
fi

for f in "$XDG_CONFIG_HOME"/*/*[^@].@(service|socket|target); do
    systemctl --user enable "$f"
done

# Link but don't enable unit template
for f in "$XDG_CONFIG_HOME"/*/*@.@(service|socket|target); do
    ln -sf "$f" "$XDG_CONFIG_HOME/systemd/user/"
done
