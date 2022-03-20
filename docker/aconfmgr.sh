# shellcheck shell=bash
AddPackage docker
CreateLink /etc/systemd/system/multi-user.target.wants/docker.service /usr/lib/systemd/system/docker.service
IgnorePath /opt/containerd
IgnorePath /etc/docker/key.json
CopyFile /etc/docker/daemon.json
CopyFile /etc/modprobe.d/docker.conf
CopyFile /etc/systemd/system/docker.service.d/resourcecontrol.conf

AddPackage docker-compose

sudo usermod --append --groups docker "$USER"
