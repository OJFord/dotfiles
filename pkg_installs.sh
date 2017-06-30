#!/bin/sh

install() {
    pkg="$1"
    pacaur --noconfirm -Sy "$pkg"
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
install python
install rustup
install shellcheck
install stack
install terraform
install thefuck
install ttf-iosevka-ss05
install ttf-iosevka-term-ss05
install vim
install xonsh
install yubico-c
install yubico-c-client
install yubico-pam
install yubico-personalization
