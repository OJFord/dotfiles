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
    require firefox
}

install_wm() {
    # Extra polybar dependencies
    require autoconf
    require automake
    require i3ipc-glib-git
    #

    require dex
    require i3-wm
    require i3status
    require polybar
    require xorg-server
    require xorg-xinit
}
