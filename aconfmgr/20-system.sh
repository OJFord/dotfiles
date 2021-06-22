# shellcheck shell=bash
if [ "$(uname --nodename)" = desk ]; then
    AddPackage xf86-video-ati
    CopyFile /etc/X11/xorg.conf.d/10-benq-bl2420pt.conf

fi

# SSD TRIM
CreateLink /etc/systemd/system/timers.target.wants/fstrim.timer /usr/lib/systemd/system/fstrim.timer

AddPackage earlyoom
CreateLink /etc/systemd/system/multi-user.target.wants/earlyoom.service /usr/lib/systemd/system/earlyoom.service

CopyFile /etc/X11/xorg.conf.d/00-keyboard.conf
sed -i 's/^#\(en_GB\.UTF-8\)/\1/' "$(GetPackageOriginalFile glibc /etc/locale.gen)"
sudo locale-gen
IgnorePath /usr/lib/locale/locale-archive
IgnorePath /etc/locale.conf
CopyFile /etc/vconsole.conf

# Scanner
AddPackage simple-scan
AddPackage usbutils

CreateLink /etc/localtime /usr/share/zoneinfo/GB
CreateLink /etc/systemd/system/dbus-org.freedesktop.timesync1.service /usr/lib/systemd/system/systemd-timesyncd.service
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service /usr/lib/systemd/system/systemd-timesyncd.service

IgnorePath /etc/fstab
IgnorePath /etc/grub.d/*

IgnorePath /etc/group*
IgnorePath /etc/gshadow*
IgnorePath /etc/passwd*
IgnorePath /etc/shadow*
f="$(GetPackageOriginalFile sudo /etc/sudoers)"
sed -i_ 's|^#\(#includedir /etc/sudoers\.d\)|\1|' "$f"
sudo rm "${f}_"
CopyFile "/etc/sudoers.d/10-$(whoami)"

IgnorePath '/**/*.lock'
IgnorePath '/**/*.cache'
IgnorePath /etc/machine-id
CreateLink /etc/os-release ../usr/lib/os-release
IgnorePath /etc/udev/hwdb.bin

IgnorePath /usr/share/mime/*
