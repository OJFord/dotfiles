#!/bin/sh
set -e

install_fonts() {
    #!FIXME: iosevka-generate depends on ttfautohint, for which PGP check will fail
    trust_install ttfautohint

    install iosevka-generate
    iosevka-generate

    install twemoji
}
