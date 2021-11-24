# shellcheck shell=bash

IgnorePath /swapfile
CopyFile /etc/systemd/system/swapfile.swap
CopyFile /etc/systemd/system/swapfile-create.service
CreateLink /etc/systemd/system/multi-user.target.wants/swapfile.swap /etc/systemd/system/swapfile.swap
