# shellcheck shell=bash
AddPackage sway
AddPackage --foreign sway-systemd
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