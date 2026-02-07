# shellcheck shell=bash

IgnorePath '/swap/*'
cat > "$(CreateFile /etc/cmdline.d/swap.conf 755)" <<-EOF
	zswap.enabled=1
EOF

root_device="$(findmnt --noheadings --output=source --target=/ | sed 's|\[/@[a-z]*\]$||')"
AddPackage btrfs-progs
# TODO: could this be a systemd unit conditional on the subvol not already existing?
# one time if not done in install:
# mount -o subvolid=5 $root_device /mnt
# btrfs subvolume create /mnt/@swap
# umount /mnt
cat > "$(CreateFile /etc/systemd/system/swap.mount)" <<-EOF
	[Unit]
	Description=mounting @swap subvolume
	DefaultDependencies=no
	Conflicts=umount.target
	Before=umount.target

	[Mount]
	What=$root_device
	Where=/swap
	Type=btrfs
	Options=subvol=@swap,nodatacow,nodatasum
EOF

CopyFile /etc/systemd/system/swap-hibernate.swap
CopyFile /etc/systemd/system/swap-hibernate-create.service
CreateLink /etc/systemd/system/swap.target.wants/swap-hibernate.swap /etc/systemd/system/swap-hibernate.swap
CreateLink /etc/systemd/system/swap-hibernate.swap.requires/swap-hibernate-create.service /etc/systemd/system/swap-hibernate-create.service

CopyFile /etc/systemd/system/swap-zswap.swap
CopyFile /etc/systemd/system/swap-zswap-create.service
CreateLink /etc/systemd/system/swap.target.wants/swap-zswap.swap /etc/systemd/system/swap-zswap.swap
CreateLink /etc/systemd/system/swap-zswap.swap.requires/swap-zswap-create.service /etc/systemd/system/swap-zswap-create.service
