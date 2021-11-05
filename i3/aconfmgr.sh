# shellcheck shell=bash
AddPackage i3-wm

# Status bar
AddPackage --foreign polybar

# Sleep
AddPackage i3lock
CopyFile /etc/systemd/system/i3lock@.service
CreateLink "/etc/systemd/system/sleep.target.wants/i3lock@$(whoami).service" /etc/systemd/system/i3lock@.service
CopyFile /etc/systemd/logind.conf.d/sleep.conf
