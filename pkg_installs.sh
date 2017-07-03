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
install diff-so-fancy
install firefox
install git
install gnupg
install htop
install httplab
install i3-wm
install irssi
install jq
install keybase-bin
install libu2f-host
install npm
install otfcc
install perl-term-readkey
install pinentry
install python
install python-prompt_toolkit
install ripgrep
install rustup
install shellcheck
install stack
install sudo
install terraform
install thefuck
install vim
install wuzz
install xonsh
install yubico-c
install yubico-c-client
install yubico-pam
install yubico-personalization
install zathura

trust_install ttfautohint
