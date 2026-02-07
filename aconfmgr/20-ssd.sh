# shellcheck shell=bash
if [ "$(lsblk --noheadings --output=ROTA "$(findmnt --noheadings --output=SOURCE --target=/boot)")" = 0 ]; then
    >&2 echo 'Boot disk seems to be an SSD, loading SSD conf'
else
    exit 0
fi

CreateLink /etc/systemd/system/timers.target.wants/fstrim.timer /usr/lib/systemd/system/fstrim.timer
CopyFile /etc/sysctl.d/20-ssd-swap.conf
