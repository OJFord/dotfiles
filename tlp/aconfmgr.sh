# shellcheck shell=bash
AddPackage tlp
AddPackage --foreign tlp-rdw-systemd
CopyFile /etc/tlp.d/10-netlink-change.conf
CopyFile /etc/tlp.d/10-usb-autosuspend.conf
