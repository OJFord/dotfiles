#!/bin/sh
set -e

install_pkg_mgr() {
    tmp_dir=/tmp/pacaur_install

    mkdir -p "$tmp_dir"
    cd "$tmp_dir"

    deps="\
        binutils \
        expac \
        fakeroot \
        gcc \
        git \
        make \
        pkg-config \
        yajl \
    "
    sudo pacman -Sy --needed --noconfirm --noedit "$deps"

    if [ ! -n "$(pacman -Qs cower)" ]; then
        curl -o PKGBUILD \
            "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower-git"
        makepkg PKGBUILD --install
    fi

    if [ ! -n "$(pacman -Qs pacaur)" ]; then
        curl -o PKGBUILD \
            "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur"
        makepkg PKGBUILD --install
    fi

    pacaur -Syu
}

require() {
    pkg="$1"
    if [ ! -n "$(pacman -Qs "$pkg")" ]; then
        pacaur -S --noconfirm --noedit "$pkg"
    fi
}

trust_require() {
    pkg="$1"
    mkdir -p /tmp/trust_require
    cd /tmp/trust_require
    if [ ! -n "$(pacman -Qs "$pkg")" ]; then
        curl -o PKGBUILD \
        "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=$pkg"
        makepkg PKGBUILD --install --skippgpcheck
    fi
}
