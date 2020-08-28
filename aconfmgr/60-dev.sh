# Misc. development tools that don't have their own conf dir

AddPackage dbeaver
AddPackage postgresql
IgnorePath /etc/dbeaver/bundles.info
IgnorePath /usr/lib/jvm/*

AddPackage docker
CreateLink /etc/systemd/system/multi-user.target.wants/docker.service /usr/lib/systemd/system/docker.service
IgnorePath /opt/containerd
IgnorePath /etc/docker/key.json
CopyFile /etc/docker/daemon.json
CopyFile /etc/modprobe.d/docker.conf
CopyFile /etc/systemd/system/docker.service.d/resourcecontrol.conf

AddPackage dbeaver
AddPackage docker-compose
AddPackage fd
AddPackage fzf

AddPackage ghc-libs
IgnorePath /usr/lib/ghc-*/package.conf.d/*

AddPackage gnu-netcat
AddPackage helm
AddPackage jq
AddPackage kubectl
AddPackage kubectx
AddPackage python-pre-commit
AddPackage ripgrep
AddPackage shellcheck
AddPackage --foreign stern
AddPackage terraform
AddPackage unzip
AddPackage yarn
