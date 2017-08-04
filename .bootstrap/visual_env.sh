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
    require firefox-nightly-en-gb

    # Fix Chromium DPI
    sudo sed -i 's/Exec=chromium %U/Exec=chromium --force-device-scale-factor=1 %U/' \
        /usr/share/applications/chromium.desktop
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
    require polybar
    require xorg-server
    require xorg-xinit
}
