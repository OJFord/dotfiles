#!/bin/sh
set -e

iosevka_dir="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)/iosevka"

install_deps() {
    pacaur -S --needed npm ttfautohint
}

install_iosevka() {
    install_deps

    if [ ! -d "$iosevka_dir" ]; then
        git clone --depth=1 https://github.com/be5invis/Iosevka/ "$iosevka_dir"
        cd "$iosevka_dir"
    else
        cd "$iosevka_dir"
        git pull
    fi
    npm install
}

generate_font() {
    name="$1"
    style="$2"
    up_style="$3"
    it_style="$4"
    ob_style="$5"
    font_dir="$iosevka_dir/dist/iosevka-$name/ttf"

    install_iosevka

    make custom-config set="$name" \
        design="$style" \
        upright="$up_style" \
        italic="$it_style" \
        oblique="$ob_style" \
        && make custom set="$name"

    cd "$font_dir"
    for fontf in *; do
        sudo ln -sf "$font_dir/$fontf" "/usr/share/fonts/TTF/$fontf"
    done
}


style="\
    sans \
    v-a-doublestory \
    v-g-opendoublestory \
    v-m-shortleg \
    v-t-standard \
    v-q-taily \
    v-zero-slashed \
    v-tilde-low \
    v-asterisk-low \
    v-paragraph-high \
    v-caret-high \
    v-underscore-low \
    v-at-short \
    v-eszet-sulzbacher \
    v-dollar-through \
    v-numbersign-upright \
"

up_style="\
    v-l-zshaped \
    v-i-serifed \
    v-brace-straight \
"

it_style="\
    v-l-hooky \
    v-i-hooky \
    v-brace-curly \
"

ob_style="\
    v-l-hooky \
    v-i-serifed \
    v-brace-curly \
"

generate_font "custom-with-ligs" "$style" "$up_style" "$it_style" "$ob_style"
generate_font "custom-no-ligs" "term $style" "$up_style" "$it_style" "$ob_style"
