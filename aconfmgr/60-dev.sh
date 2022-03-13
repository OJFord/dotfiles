# shellcheck shell=bash
# Misc. development tools that don't have their own conf dir

AddPackage dbeaver
AddPackage postgresql
IgnorePath /etc/dbeaver/bundles.info
IgnorePath /usr/lib/jvm/*

AddPackage dbeaver
AddPackage fd
AddPackage fzf

AddPackage ghc-libs
IgnorePath /usr/lib/ghc-*/package.conf.d/*

AddPackage gnu-netcat
AddPackage helm
AddPackage --foreign jq-git
AddPackage kubectl
AddPackage kubectx
AddPackage python-pre-commit
AddPackage restic
AddPackage ripgrep
AddPackage shellcheck
AddPackage stern
AddPackage unzip
AddPackage yarn
