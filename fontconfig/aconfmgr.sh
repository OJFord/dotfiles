# shellcheck shell=bash
AddPackage otf-font-awesome
AddPackage noto-fonts
AddPackage noto-fonts-emoji
AddPackage noto-fonts-extra

CreateLink /etc/fonts/conf.d/50-user.conf /usr/share/fontconfig/conf.avail/50-user.conf
