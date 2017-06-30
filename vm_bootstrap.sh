#!/bin/sh
set -e

tmp_dir=/tmp/pacaur_install

sudo pacman -Syu
mkdir -p "$tmp_dir"
cd "$tmp_dir"

sudo pacman -S binutils make gcc fakeroot expac yajl git --noconfirm --needed

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
pacaur -Sy open-vm-tools open-vm-tools-dkms
