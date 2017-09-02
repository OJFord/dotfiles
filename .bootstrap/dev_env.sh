#!/bin/sh
set -e

install_cli() {
    require alacritty-git
    require thefuck
    require fish
}

install_dev_tools() {
    langs="$1"

    require htop
    require httplab
    require irssi
    require jq
    require prettyping
    require ripgrep
    require terraform
    require vim
    require wuzz-git

    for lang in $langs; do
        eval "install_dev_tools_$lang"
    done
}

install_dev_tools_haskell() {
    require ncurses5-compat-libs
    require stack
}

install_dev_tools_python() {
    require flake8
    require mypy
    require python
    require python-isort
}

install_dev_tools_rust() {
    require rustup
    rustup default stable
}

install_dev_tools_shell() {
    require shellcheck
}

install_password_mgr() {
    require keybase-bin
}

install_security_key() {
    require ccid
    require gnupg
    require libu2f-host
    require libusb-compat
    require pcsclite
    require pinentry
    require yubico-c
    require yubico-c-client
    require yubico-pam
    require yubikey-personalization

    sudo chown -R "$(whoami)" "$BOOTSTRAP_DIR/../gnupg"
    sudo chmod 600 "$BOOTSTRAP_DIR/../gnupg"/*
    sudo chmod 700 "$BOOTSTRAP_DIR/../gnupg"/*/
    sudo chmod 700 "$BOOTSTRAP_DIR/../gnupg"
    mkdir -p "$BOOTSTRAP_DIR/../gnupg/ssh"

    sudo systemctl enable pcscd
    killall scdaemon gpg-agent
    sudo systemctl restart pcscd
}

install_svc() {
    require diff-so-fancy
    require git
    require openssh
    require perl-term-readkey
}
