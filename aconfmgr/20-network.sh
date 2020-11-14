# shellcheck shell=bash
AddPackage dhcpcd
CreateLink /etc/systemd/system/multi-user.target.wants/dhcpcd.service /usr/lib/systemd/system/dhcpcd.service

IgnorePath /etc/hostname
IgnorePath /etc/resolv.conf

CopyFile /etc/ssh/sshd_config
CreateLink /etc/systemd/system/multi-user.target.wants/sshd.service /usr/lib/systemd/system/sshd.service
IgnorePath /etc/ssh/ssh_host_*_key*

# wifi
AddPackage iwd
CopyFile /etc/iwd/main.conf
CreateLink /etc/systemd/system/multi-user.target.wants/iwd.service /usr/lib/systemd/system/iwd.service
CopyFile /etc/systemd/network/25-wlan.network
