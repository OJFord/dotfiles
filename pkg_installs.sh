#!/bin/sh
set -e

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

pacaur -Syu

install alacritty-git
install albert
install automake
install autoconf
install ccid
install compton-git
install dex
install diff-so-fancy
install firefox
install git
install gnupg
install htop
install httplab
install i3-wm
install i3ipc-glib-git
install i3status
install iosevka-generate
install irssi
install jq
install keybase-bin
install libu2f-host
install libusb-compat
install npm
install open-vm-tools
install openssh
install otfcc
install perl-term-readkey
install pinentry
install pcsclite
install polybar
install prettyping
install python
install python-prompt_toolkit
install ripgrep
install rustup
install shellcheck
install stack
install sudo
install terraform
install thefuck
install twemoji
install vim
install wuzz
install xonsh
install xorg-server
install xorg-xinit
install yubico-c
install yubico-c-client
install yubico-pam
install yubico-personalization
install zathura

trust_install ttfautohint

sudo systemctl enable pcscd
