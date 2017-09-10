#!/bin/sh
set -e

install_fonts() {
    require OJFord/formulae/iosevka-generate --HEAD
    iosevka-generate
    sudo ln -sf "$HOME/Library/Fonts" "$HOME/.local/share/fonts"
}
