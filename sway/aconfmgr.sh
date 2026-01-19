# shellcheck shell=bash
AddPackage sway
AddPackage --foreign sway-systemd
# https://github.com/alebastr/sway-systemd/issues/40
sed -i -E 's@^(exec .+/session.sh)$@\1 --add-env=XDG_SESSION_ID@' "$(GetPackageOriginalFile sway-systemd /etc/sway/config.d/10-systemd-session.conf)"
# https://aur.archlinux.org/packages/sway-systemd#comment-1051236
SetFileProperty /etc/sway/config.d/95-system-keyboard-config.conf deleted y # clobbers `input:keyboard`
AddPackage --foreign wev

# Backlight
AddPackage brightnessctl
AddPackage --foreign wluma

# Background
AddPackage swaybg

# Clipboard
AddPackage --foreign cliphist
AddPackage wl-clipboard
AddPackage wtype

# Screenshotting
AddPackage --foreign grimshot

# Sleep
AddPackage swayidle
AddPackage swaylock
AddPackage --foreign systemd-lock-handler
