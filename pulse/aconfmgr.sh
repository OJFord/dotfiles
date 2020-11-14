# shellcheck shell=bash
AddPackage pipewire
CreateLink /etc/systemd/user/sockets.target.wants/pipewire.socket /usr/lib/systemd/user/pipewire.socket
sed -i -E 's/(exec .*pipewire-media-session).*/\1 -e bluez,pulse-bridge/' "$(GetPackageOriginalFile pipewire '/etc/pipewire/pipewire.conf')"
AddPackage --foreign pipewire-pulse-dropin

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
