# shellcheck shell=bash
CreateLink /etc/resolv.conf /run/systemd/resolve/stub-resolv.conf

CopyFile /etc/ssh/sshd_config
CreateLink /etc/systemd/system/multi-user.target.wants/sshd.service /usr/lib/systemd/system/sshd.service
IgnorePath /etc/ssh/ssh_host_*_key*

CopyFile /etc/systemd/network/20-ethernet.network
CopyFile /etc/systemd/network/20-wlan.network
CopyFile /etc/systemd/network/20-wwan.network

# wifi
AddPackage iwd
CopyFile /etc/iwd/main.conf
CreateLink /etc/systemd/system/multi-user.target.wants/iwd.service /usr/lib/systemd/system/iwd.service

# USB tether
CopyFile /etc/systemd/network/50-phone0.link
CopyFile /etc/systemd/network/50-phone-tethering.network
CopyFile /etc/udev/rules.d/90-phone-tethering.rules
