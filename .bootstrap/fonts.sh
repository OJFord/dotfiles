#!/bin/sh
set -e

install_fonts() {
    gpg --keyserver pgp.mit.edu --recv-keys C1A60EACE707FDA5
    require iosevka-generate
    iosevka-generate

    require ttf-twemoji-color
}
