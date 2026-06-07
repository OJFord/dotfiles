# shellcheck shell=bash
AddPackage podman
CopyFile /etc/subuid
CopyFile /etc/subgid

AddPackage podman-compose

AddPackage podman-docker
CreateFile /etc/containers/nodocker
