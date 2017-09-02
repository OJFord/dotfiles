#!/bin/sh
set -e

install_launcher() {
    require albert
    require compton-git
}

install_pdf_viewer() {
    require zathura
}

install_web_browser() {
    require chromium

    app_files="$HOME/.local/share/applications"
    mkdir -p "$app_files"
    cp "$BOOTSTRAP_DIR/chromium.desktop" "$app_files/chromium.desktop"
}

install_wm() {
    # Extra polybar dependencies
    require autoconf
    require automake
    require i3ipc-glib-git
    require libjson-rpc-cpp
    #

    require dex
    require i3-wm
    require i3status
    require polybar-git
    require xorg-server
    require xorg-xinit
    require xorg-xrandr

    if [ ! -L "$BOOTSTRAP_DIR/../X/xrandr.sh" ]; then
        read -n1 -rsp "
            For correct display settings, this machine's xrandr script should now
            be the symlink destination for xrandr.sh. e.g.

                ln -sf .../X/xrandr.sh.mba .../X/xrandr.sh

            Press any key to acknowledge and continue.
        "
    fi
}
