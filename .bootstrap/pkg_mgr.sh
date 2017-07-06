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
        makepkg PKGBUILD --install --needed
    fi

    if [ ! -n "$(pacman -Qs pacaur)" ]; then
        curl -o PKGBUILD \
            "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur"
        makepkg PKGBUILD --install --needed
    fi

    pacaur -Syu
}

install() {
    pkg="$1"
    if [ ! -n "$(pacman -Qs "$pkg")" ]; then
        pacaur -S --noconfirm --noedit "$pkg"
    fi
}

trust_install() {
    pkg="$1"
    mkdir -p /tmp/trust_install
    cd /tmp/trust_install
    if [ ! -n "$(pacman -Qs "$pkg")" ]; then
        curl -o PKGBUILD \
        "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=$pkg"
        makepkg PKGBUILD --install --skippgpcheck
    fi
}
