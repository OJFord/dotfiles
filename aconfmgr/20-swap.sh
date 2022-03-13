# shellcheck shell=bash

IgnorePath /swapfile
CopyFile /etc/systemd/system/swapfile.swap
CopyFile /etc/systemd/system/swapfile-create.service
CreateLink /etc/systemd/system/multi-user.target.wants/swapfile.swap /etc/systemd/system/swapfile.swap

# Before and during first `apply`, the swap device does not exist so cannot be used until the second.
if swap_device="$(findmnt --noheadings --output=source --target=/swapfile)"; then
    swap_offset="$(sudo filefrag -v /swapfile | awk '$1=="0:" {print substr($4, 1, length($4)-2)}')"

    # Enable hibernation
    for f in /boot/loader/entries/arch-*.conf; do
        resume_f="$(echo "$f" | sed -E 's/(.*)\.conf/\1-resume-hibernation.conf/')"
        sed -E "s/(title .*)/\1 (resume)/;s@(options .*)@\1 resume=${swap_device} resume_offset=${swap_offset}@" "$f" \
            > "$(CreateFile "$resume_f")"
        SetFileProperty "$resume_f" mode 755
    done

    CopyFile /etc/systemd/logind.conf.d/sleep.conf
    CopyFile /usr/lib/systemd/system-sleep/log 755
else
    >&2 echo 'Swap device not yet created, cannot enable hibernation. Apply again.'
fi
