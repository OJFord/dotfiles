#!/bin/sh
set -e

install_vm_guest() {
    install open-vm-tools
}

install_vm_shared_dir() {
    target="$1"
    mkdir "$target"

    sudo echo ".host:/share $target fuse.vmhgfs-fuse defaults 0 0" \
        | tee --append /etc/fstab

    mount "$target"
}
