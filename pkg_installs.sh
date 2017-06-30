#!/bin/sh

sudo aura -Syu
sudo aura -Ayu

sudo aura --noconfirm -Sy dex
sudo aura --noconfirm -Sy git
sudo aura --noconfirm -Sy gnupg
sudo aura --noconfirm -Sy i3-wm
sudo aura --noconfirm -Sy irssi
sudo aura --noconfirm -Sy thefuck
sudo aura --noconfirm -Sy vim

sudo aura --noconfirm -Ay alacritty
sudo aura --noconfirm -Ay albert
sudo aura --noconfirm -Ay compton-git
sudo aura --noconfirm -Ay xonsh
