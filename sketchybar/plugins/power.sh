#!/usr/bin/env bash
set -eEuo pipefail

remaining="$(pmset -g batt | ggrep --only-matching -P "\d+%" | cut -d% -f1)"
case "$remaining" in
    9[0-9]|100)
        icon=""
        ;;
    [6-8][0-9])
        icon=""
        ;;
    [3-5][0-9])
        icon=""
        ;;
    [1-2][0-9])
        icon=""
        ;;
    *)  icon=""
esac

showlabel=on
if pmset -g batt | grep 'AC Power' --quiet; then
    icon='⚡'
    if ! pmset -g batt | grep ' charging;' --quiet; then
        showlabel=off
    fi
fi

sketchybar --set "$NAME" icon="$icon" label="${remaining}%" label.drawing="$showlabel"
