#!/bin/sh
set -e

install_cli() {
    require alacritty-git
    require python-prompt_toolkit
    require thefuck
    require xonsh
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
    require wuzz

    for lang in $langs; do
        exec "install_dev_tools_$lang"
    done
}

install_dev_tools_haskell() {
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
    rustup default nightly
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
    require yubico-personalization

    sudo systemctl enable pcscd
}

install_svc() {
    require diff-so-fancy
    require git
    require openssh
    require perl-term-readkey
}