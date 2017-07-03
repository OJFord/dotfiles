#!/bin/sh
set -e

this_dir="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)"
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

# Cleanup automatic dotfiles that either won't be used, or will move to XDG dir
rubbish="$(
    find "$HOME" -maxdepth 1 -name ".*" -not -iname "$this_dir" -not -iname ".local"
)"
rm -rf "$rubbish"
