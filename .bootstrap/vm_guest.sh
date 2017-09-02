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

    read -n1 -rsp "
        In order to use a USB security key inside a VM, the following lines
        must be added to {vmname}.vmwarevm/{vmname}.vmx:

            usb.generic.pluginAction = "guest"
            usb.generic.allowHID = "TRUE"
            usb.generic.allowLastHID = "TRUE"

        A VM restart may then be necessary.

        Press any key to acknowledge and continue.
    "
}

install_vm_shared_dir() {
    target="$1"
    if ! sudo mountpoint -q "$target"; then
        mkdir "$target"

        echo ".host:/share $target fuse.vmhgfs-fuse defaults 0 0" \
            | sudo tee --append /etc/fstab >/dev/null

        sudo mount "$target"
    fi
}
