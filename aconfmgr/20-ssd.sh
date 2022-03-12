# shellcheck shell=bash
if [ "$(cat "/sys/block/$(findmnt --noheadings --output=SOURCE --target=/boot | sed -E 's@/dev/(.*)p[0-9]+$@\1@')/queue/rotational")" = 0 ]; then
    >&2 echo 'Boot disk seems to be an SSD, loading SSD conf'
else
    exit 0
fi

CreateLink /etc/systemd/system/timers.target.wants/fstrim.timer /usr/lib/systemd/system/fstrim.timer
CopyFile /etc/sysctl.d/20-ssd-swap.conf
