#!/bin/sh

install() {
    pkg="$1"
    pacaur --noconfirm -Sy "$pkg"
}

trust_install() {
    pkg="$1"
    gpghome=/tmp/pacaurgpg
    mkdir -p "$gpghome"
    echo 'keyserver-options auto-key-retrieve' > "$gpghome"
    GNUPGHOME="$gpghome" pacaur --noconfirm -Sy "$pkg"
}

pacaur -Syu

install alacritty-git
install albert
install compton-git
install dex
install git
install gnupg
install i3-wm
install irssi
install libu2f-host
install npm
install otfcc
install python
install rustup
install shellcheck
install stack
install terraform
install thefuck
install vim
install xonsh
install yubico-c
install yubico-c-client
install yubico-pam
install yubico-personalization

trust_install ttfautohint
