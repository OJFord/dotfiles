# shellcheck shell=bash

# shellcheck disable=SC2154
this_dir="$config_dir" # defined in aconfmgr

if ! [ -L "${XDG_CONFIG_HOME-}" ]; then
    if [ -z "${XDG_CONFIG_HOME-}" ]; then
        export XDG_CONFIG_HOME="$HOME/.config"
        echo set xdgch
    fi

    rm -r "$HOME/.config" # only this dir may have been created automatically, leave other XDG_CONFIG_HOMEs
    ln -sT "$(realpath --relative-to="$(dirname "$XDG_CONFIG_HOME")" "$this_dir/..")" "$XDG_CONFIG_HOME"
fi

if ! [ -L "$HOME/.profile" ]; then
    rm -f "$HOME/.profile" "$HOME"/.{bash,less,npm,vim}*
    ln -sT "$(realpath --relative-to="$HOME" --no-symlinks "$XDG_CONFIG_HOME/.profile")" "$HOME/.profile"
fi

# shellcheck source=/dev/null
. "$XDG_CONFIG_HOME/by-hostname/$(uname --nodename)/aconfmgr.sh"

AddPackage earlyoom
CreateLink /etc/systemd/system/multi-user.target.wants/earlyoom.service /usr/lib/systemd/system/earlyoom.service

sed -i 's/^#\(en_GB\.UTF-8\)/\1/' "$(GetPackageOriginalFile glibc /etc/locale.gen)"
sudo locale-gen
IgnorePath /usr/lib/locale/locale-archive
CopyFile /etc/locale.conf
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
sudo usermod --comment='Oliver Ford' "$(whoami)"

IgnorePath '/**/*.lock'
IgnorePath '/**/*.cache'
IgnorePath /etc/machine-id
IgnorePath /etc/machine-info
CreateLink /etc/os-release ../usr/lib/os-release
IgnorePath /etc/udev/hwdb.bin

IgnorePath /usr/share/mime/*

# Power
AddPackage tlp
AddPackage tlp-rdw
CopyFile /etc/tlp.d/10-usb-autosuspend.conf
