# shellcheck shell=bash
AddPackage pulseaudio-alsa
CreateLink /etc/systemd/user/sockets.target.wants/pulseaudio.socket /usr/lib/systemd/user/pulseaudio.socket

# keybindings
AddPackage pavucontrol
AddPackage playerctl

# bluetooth
AddPackage --foreign pulseaudio-modules-bt
AddPackage blueman
AddPackage bluez
AddPackage --foreign bluez-utils-compat
CreateLink /etc/systemd/system/bluetooth.target.wants/bluetooth.service /usr/lib/systemd/system/bluetooth.service
CreateLink /etc/systemd/system/dbus-org.bluez.service /usr/lib/systemd/system/bluetooth.service
