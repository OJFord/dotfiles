IgnorePath '/boot/*'
IgnorePath '/etc/.updated'
IgnorePath '/etc/ca-certificates/extracted/*'
IgnorePath '/etc/ssl/certs/*'
IgnorePath '/var/*'

AddPackage linux
IgnorePath '/etc/mkinitcpio.d/linux.preset'
IgnorePath '/usr/lib/modules/*'

AddPackage linux-firmware
AddPackage linux-headers

AddPackage coreutils
IgnorePath '/usr/share/info/dir'

AddPackage grub
AddPackage lvm2
AddPackage systemd-sysvcompat

AddPackageGroup base-devel
AddPackage man-pages
AddPackage man-db

AddPackage pacman-contrib
CopyFile /etc/pacman.d/hooks/pacdiff.hook
IgnorePath '/etc/pacman.d/gnupg/*'
curl --silent 'https://www.archlinux.org/mirrorlist/?country=GB&protocol=https&use_mirror_status=on' \
    | sed -e 's/^#Server/Server/g' -e '/^#/d' \
    | rankmirrors -n 5 - \
    | sort \
    > "$(CreateFile '/etc/pacman.d/mirrorlist')"
# Sort destroys ranking within the selected closest mirrors,
# but makes it less likely to churn between runs.

CreateLink '/etc/systemd/system/ctrl-alt-del.target' '/usr/lib/systemd/system/reboot.target'
CreateLink '/etc/systemd/system/dbus-org.freedesktop.network1.service' '/usr/lib/systemd/system/systemd-networkd.service'
CreateLink '/etc/systemd/system/dbus-org.freedesktop.resolve1.service' '/usr/lib/systemd/system/systemd-resolved.service'
CreateLink '/etc/systemd/system/getty.target.wants/getty@tty1.service' '/usr/lib/systemd/system/getty@.service'
CreateLink '/etc/systemd/system/initrd-root-fs.target.wants/systemd-repart.service' '/usr/lib/systemd/system/systemd-repart.service'
CreateLink '/etc/systemd/system/multi-user.target.wants/machines.target' '/usr/lib/systemd/system/machines.target'
CreateLink '/etc/systemd/system/multi-user.target.wants/remote-cryptsetup.target' '/usr/lib/systemd/system/remote-cryptsetup.target'
CreateLink '/etc/systemd/system/multi-user.target.wants/remote-fs.target' '/usr/lib/systemd/system/remote-fs.target'
CreateLink '/etc/systemd/system/multi-user.target.wants/systemd-networkd.service' '/usr/lib/systemd/system/systemd-networkd.service'
CreateLink '/etc/systemd/system/multi-user.target.wants/systemd-resolved.service' '/usr/lib/systemd/system/systemd-resolved.service'
CreateLink '/etc/systemd/system/network-online.target.wants/systemd-networkd-wait-online.service' '/usr/lib/systemd/system/systemd-networkd-wait-online.service'
CreateLink '/etc/systemd/system/sockets.target.wants/systemd-networkd.socket' '/usr/lib/systemd/system/systemd-networkd.socket'
CreateLink '/etc/systemd/system/sockets.target.wants/systemd-userdbd.socket' '/usr/lib/systemd/system/systemd-userdbd.socket'
CreateLink '/etc/systemd/system/sysinit.target.wants/systemd-repart.service' '/usr/lib/systemd/system/systemd-repart.service'
CreateLink '/etc/systemd/system/systemd-remount-fs.service.wants/systemd-pstore.service' '/usr/lib/systemd/system/systemd-pstore.service'
