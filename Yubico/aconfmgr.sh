# shellcheck shell=bash
AddPackage pam-u2f

CopyFile /etc/udev/rules.d/90-yubikey.rules
