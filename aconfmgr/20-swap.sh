# shellcheck shell=bash

IgnorePath /swapfile
CopyFile /etc/systemd/system/swapfile.swap
CopyFile /etc/systemd/system/swapfile-create.service
CreateLink /etc/systemd/system/multi-user.target.wants/swapfile.swap /etc/systemd/system/swapfile.swap

swap_device="$(findmnt --noheadings --output=source --target=/swapfile)"
swap_offset="$(sudo filefrag -v /swapfile | awk '$1=="0:" {print substr($4, 1, length($4)-2)}')"

# Enable hibernation
sed -E "s/(title .*)/\1 (resume)/;s@(options .*)@\1 resume=${swap_device} resume_offset=${swap_offset}@" /boot/loader/entries/arch.conf \
   > "$(CreateFile /boot/loader/entries/arch-resume-hibernation.conf)"
SetFileProperty /boot/loader/entries/arch-resume-hibernation.conf mode 755
CopyFile /etc/systemd/logind.conf.d/sleep.conf
CopyFile /usr/lib/systemd/system-sleep/log 755
