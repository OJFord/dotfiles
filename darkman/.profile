rm -rf "$XDG_DATA_HOME"/{dark,light}-mode.d
mkdir -p "$XDG_DATA_HOME"/{dark,light}-mode.d

for script in "$XDG_CONFIG_HOME"/*/{dark,light}.darkman.sh; do
    tool="$(basename "$(dirname "$script")")"
    mode="$(basename --suffix=.darkman.sh "$script")"

    ln -sf "$script" "$XDG_DATA_HOME/${mode}-mode.d/$tool"
done
