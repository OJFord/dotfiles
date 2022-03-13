# shellcheck shell=bash
AddPackageGroup xorg
AddPackage xorg-xinit
AddPackage xbindkeys

AddPackage numlockx

AddPackage maim
AddPackage xclip

# Backlight
RemovePackage xorg-xbacklight # in xorg group
AddPackage acpilight # provides xbacklight
