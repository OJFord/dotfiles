#!/bin/sh

from_std() {
    pkg="$1"
    sudo aura --noconfirm -Sy "$pkg"
}

from_aur() {
    pkg="$1"
    sudo aura --noconfirm -Ay "$pkg"
}

sudo aura -Syu
sudo aura -Ayu

from_std dex
from_std git
from_std gnupg
from_std i3-wm
from_std irssi
from_std libu2f-host
from_std python
from_std rustup
from_std shellcheck
from_std stack
from_std terraform
from_std thefuck
from_std vim
from_std yubico-c
from_std yubico-c-client
from_std yubico-pam
from_std yubico-personalization

from_aur alacritty-git
from_aur albert
from_aur compton-git
from_aur ttf-iosevka-ss05
from_aur ttf-iosevka-term-ss05
from_aur xonsh
