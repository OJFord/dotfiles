#!/usr/bin/env bash
set -eEuo pipefail

vol_settings="{$(osascript -e 'get volume settings')}"

vol="$(osascript -e "output volume of $vol_settings")"
case "$vol" in
    [6-9][0-9]|100)
        icon="󰕾"
        ;;
    [3-5][0-9])
        icon="󰖀"
        ;;
    [1-9]|[1-2][0-9])
        icon="󰕿"
        ;;
    *) icon="󰖁"
esac

sketchybar --set "$NAME" icon="$icon" label="${vol}%"

if [ "$(osascript -e "output muted of $vol_settings")" = true ]; then
    sketchybar --set "$NAME" icon.color=0xff72898f label.color=0xff72898f
else
    sketchybar --set "$NAME" icon.color=0xffadbcbc label.color=0xffadbcbc
fi
