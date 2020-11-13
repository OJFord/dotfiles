# shellcheck shell=bash
# Decrypt home dir from $HOME.cipher
AddPackage gocryptfs
AddPackage pam_mount
CopyFile /etc/fuse.conf
CopyFile /etc/pam.d/system-login
CopyFile /etc/security/pam_mount.conf.xml
