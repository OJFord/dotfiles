#!/bin/sh

sudo aura -Syu
sudo aura -Ayu

sudo aura --noconfirm -Sy dex

sudo aura --noconfirm -Ay albert
sudo aura --noconfirm -Ay compton-git
