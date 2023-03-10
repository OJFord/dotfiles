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
# -git until released (likely >=v2.2): https://github.com/bugaevc/wl-clipboard/commit/86eacb7cd74e88a839296b3b83bad2d954bea840
AddPackage wl-clipboard-git
AddPackage wtype

# Screenshotting
AddPackage --foreign grimshot

# Sleep
AddPackage swayidle
AddPackage swaylock
AddPackage --foreign systemd-lock-handler
