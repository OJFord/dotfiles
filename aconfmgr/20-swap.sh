# shellcheck shell=bash

IgnorePath /swapfile
CopyFile /etc/systemd/system/swapfile.swap
CopyFile /etc/systemd/system/swapfile-create.service
CreateLink /etc/systemd/system/swap.target.wants/swapfile.swap /etc/systemd/system/swapfile.swap
CreateLink /etc/systemd/system/swapfile.swap.requires/swapfile-create.service /etc/systemd/system/swapfile-create.service
