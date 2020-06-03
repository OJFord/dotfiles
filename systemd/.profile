shopt -s extglob

for f in "$XDG_CONFIG_HOME"/*/*[^@].@(service|socket|target); do
    systemctl --user enable "$f"
done
