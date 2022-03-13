# shellcheck shell=bash
IgnorePath '/etc/.updated'
IgnorePath '/etc/ca-certificates/extracted/*'
IgnorePath '/etc/ssl/certs/*'
IgnorePath '/var/*'

AddPackage linux
AddPackage linux-lts
CopyFile /boot/loader/loader.conf 755
IgnorePath '/boot/*/*.EFI'
IgnorePath '/boot/*/*.efi'
IgnorePath '/boot/EFI/*'
IgnorePath '/boot/*.img'
IgnorePath '/boot/vmlinuz-*'
IgnorePath /boot/loader/random-seed
CopyFile /etc/mkinitcpio.conf
IgnorePath '/etc/mkinitcpio.d/*.preset'
IgnorePath '/usr/lib/modules/*'

root_device="$(findmnt --noheadings --output=source --target=/)"
root_device_name="$(echo "$root_device" | rev | cut -d/ -f1 | rev)"
root_partition="$(lsblk --output=name,pkname --list --noheadings | sed -En "s@${root_device_name} +([^ ]+)@\1@p")"
root_partition_uuid="$(lsblk --noheadings --output=partuuid "/dev/$root_partition" | tr -d '\n')"
if [ "$(lsblk --noheadings --output=type "$root_device")" = crypt ]; then
    crypt_options="cryptdevice=PARTUUID=${root_partition_uuid}:${root_device_name}"
else
    crypt_options="disablehooks=encrypt"
fi
ucode="$(yay -Qs --quiet \\-ucode)"
if [ "$ucode" = 'intel-ucode' ]; then
    cpu_options="intel_pstate=no_hwp"
else
    cpu_options=
fi
linuces=('linux' 'linux-lts')
for linux in "${linuces[@]}"; do
    cat > "$(CreateFile "/boot/loader/entries/arch-${linux}.conf")" <<-EOF
		title Arch (${linux})
		linux /vmlinuz-${linux}
		initrd /${ucode}.img
		initrd /initramfs-${linux}.img
		options ${crypt_options} root=${root_device} rw ${cpu_options}
	EOF
    SetFileProperty "/boot/loader/entries/arch-${linux}.conf" mode 755
done

AddPackage linux-firmware
AddPackage linux-headers
AddPackage linux-lts-headers

AddPackage coreutils
IgnorePath '/usr/share/info/dir'

AddPackage grub
AddPackage lvm2
AddPackage systemd-sysvcompat

AddPackageGroup base-devel
AddPackage man-pages
AddPackage man-db

cat >> "$(GetPackageOriginalFile pacman /etc/pacman.conf)" <<EOF
[options]
Color
ParallelDownloads = 5
EOF
AddPackage pacman-contrib
CopyFile /etc/pacman.d/hooks/pacdiff.hook
IgnorePath '/etc/pacman.d/gnupg/*'
AddPackage reflector
CreateLink /etc/systemd/system/multi-user.target.wants/reflector.service /usr/lib/systemd/system/reflector.service
IgnorePath /etc/pacman.d/mirrorlist
CopyFile /etc/pacman.d/hooks/mirrorupgrade.hook
CreateLink /etc/systemd/system/timers.target.wants/paccache.timer /usr/lib/systemd/system/paccache.timer

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
f="$(GetPackageOriginalFile systemd /etc/systemd/journald.conf)"
sed -i_-E 's/^#?SystemMaxUse=.*$/SystemMaxUse=1G/' "$f"
