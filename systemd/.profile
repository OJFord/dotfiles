shopt -s extglob

if [ "$(uname -s)" != Linux ]; then
    return 0
fi

for f in "$XDG_CONFIG_HOME"/*/*[^@].@(service|socket|target); do
    systemctl --user enable "$f"
done
