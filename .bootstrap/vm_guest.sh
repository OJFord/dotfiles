#!/bin/sh
set -e

install_vm_guest() {
    require open-vm-tools

    vmware-toolbox-cmd timesync enable
    sudo hwclock --hctosys --localtime
    require chrony
    sudo tee /etc/chrony.conf <<-EOF
		pool pool.ntp.org iburst
		driftfile /var/lib/chrony/drift
		makestep 1 3
		rtcsync
	EOF
}

install_vm_shared_dir() {
    target="$1"
    mkdir "$target"

    sudo echo ".host:/share $target fuse.vmhgfs-fuse defaults 0 0" \
        | tee --append /etc/fstab

    mount "$target"
}