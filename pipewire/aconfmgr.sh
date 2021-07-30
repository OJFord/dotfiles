# shellcheck shell=bash
AddPackage pipewire

# keybindings
AddPackage pavucontrol
AddPackage playerctl

# bluetooth
AddPackage pipewire-pulse
AddPackage blueman
AddPackage bluez
AddPackage --foreign bluez-utils-compat
CreateLink /etc/systemd/system/bluetooth.target.wants/bluetooth.service /usr/lib/systemd/system/bluetooth.service
CreateLink /etc/systemd/system/dbus-org.bluez.service /usr/lib/systemd/system/bluetooth.service
