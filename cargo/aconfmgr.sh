# shellcheck shell=bash
AddPackage rustup
rustup default stable
rustup component add clippy
rustup component add rls
