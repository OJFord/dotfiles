# shellcheck shell=bash
AddPackage tlp
CopyFile /etc/tlp.d/10-netlink-change.conf
CopyFile /etc/tlp.d/10-usb-autosuspend.conf
