# shellcheck shell=bash
AddPackage fprintd

CopyFile /etc/pam.d/sudo
CopyFile /etc/pam.d/system-local-login
