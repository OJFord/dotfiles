#!/usr/bin/env bash
set -eEuo pipefail

sketchybar --subscribe "$NAME" space_change
active_space="$(yabai -m query --spaces | jq '.[]|select(."is-visible" == true).index')"
mapfile -t spaces < <(yabai -m query --spaces | jq '.[]|select(.windows != [] or ."is-visible" == true).index')

mapfile -t current_in_bar < <(sketchybar --query bar | jq -r '.items[] | select(startswith("space."))' | cut -d. -f2)
IFS=" " read -ra leftovers <<< "$(\
    comm -23 \
        <(echo "${current_in_bar[@]}" | tr ' ' '\n' | sort) \
        <(echo "${spaces[@]}" | tr ' ' '\n' | sort) \
)"
for i in "${leftovers[@]}"; do
    sketchybar --remove "space.$i"
done

prev="$NAME"
for i in "${spaces[@]}"; do
    if ! sketchybar --query bar | jq --exit-status ".items[] | select(. == \"space.$i\")" >/dev/null; then
        sketchybar --add space "space.$i" left
    fi
    sketchybar --move "space.$i" after "$prev"
    prev="space.$i"

    sketchybar --set "space.$i"  \
        space="$i" \
        label="$i" \
        icon.drawing=off \
        padding_right=0 \
        background.color=0x40ffffff \
        background.corner_radius=5 \
        background.height=20 \
        background.drawing="$([ "$active_space" = "$i" ] && echo true || echo false)" \
        click_script="yabai -m space --focus $i" \
        ;
done
