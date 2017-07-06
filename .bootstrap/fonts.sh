#!/bin/sh
set -e

install_fonts() {
    #!FIXME: iosevka-generate depends on ttfautohint, for which PGP check will fail
    trust_require ttfautohint

    require iosevka-generate
    iosevka-generate

    require twemoji
}
