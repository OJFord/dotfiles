#!/bin/sh
set -e

install_launcher() {
    return
}

install_pdf_viewer() {
    return
}

install_web_browser() {
    require firefox

    ln -sf "$BOOTSTRAP_DIR/../firefox/profiles.ini" "$HOME/Library/Application Support/Firefox/profiles.ini"
    ln -sf "$BOOTSTRAP_DIR/../firefox/profile" "$HOME/Library/Application Support/Firefox/Profile/profile"
}

install_wm() {
    require crisidev/chunkwm/chunkwm
    require koekeishiya/formulae/skhd

    ln -sf "$BOOTSTRAP_DIR/../chunkwm/.chunkwmrc" "$HOME/.chunkwmrc"
    ln -sf "$BOOTSTRAP_DIR/../skhd/.skhdrc" "$HOME/.skhdrc"

    brew services start chunkwm
    brew services start skhd
}
