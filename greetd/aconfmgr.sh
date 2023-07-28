# shellcheck shell=bash
AddPackage greetd
CopyFile /etc/greetd/config.toml
CreateLink /etc/systemd/system/display-manager.service /usr/lib/systemd/system/greetd.service
