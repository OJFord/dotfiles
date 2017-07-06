#!/bin/sh
set -e

install_launcher() {
    install albert
    install compton-git
}

install_pdf_viewer() {
    install zathura
}

install_web_browser() {
    install firefox
}

install_wm() {
    # Extra polybar dependencies
    install autoconf
    install automake
    install i3ipc-glib-git
    #

    install dex
    install i3-wm
    install i3status
    install polybar
    install xorg-server
    install xorg-xinit
}
