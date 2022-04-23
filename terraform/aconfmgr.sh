# shellcheck shell=bash
AddPackage --foreign tfenv
sudo usermod --append --groups=tfenv "$USER"
