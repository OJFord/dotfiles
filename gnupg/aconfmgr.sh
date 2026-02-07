# shellcheck shell=bash
AddPackage ccid
AddPackage libusb-compat
AddPackage pcsclite
CreateLink '/etc/systemd/system/sockets.target.wants/pcscd.socket' '/usr/lib/systemd/system/pcscd.socket'

AddPackage pinentry
