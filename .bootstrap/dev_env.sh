#!/bin/sh
set -e

install_cli() {
    install alacritty-git
    install python-prompt_toolkit
    install thefuck
    install xonsh
}

install_dev_tools() {
    langs="$1"

    install htop
    install httplab
    install irssi
    install jq
    install prettyping
    install ripgrep
    install terraform
    install vim
    install wuzz

    for lang in $langs; do
        exec "install_dev_tools_$lang"
    done
}

install_dev_tools_haskell() {
    install stack
}

install_dev_tools_python() {
    install flake8
    install mypy
    install python
    install python-isort
}

install_dev_tools_rust() {
    install rustup
    rustup default nightly
}

install_dev_tools_shell() {
    install shellcheck
}

install_password_mgr() {
    install keybase-bin
}

install_security_key() {
    install ccid
    install gnupg
    install libu2f-host
    install libusb-compat
    install pcsclite
    install pinentry
    install yubico-c
    install yubico-c-client
    install yubico-pam
    install yubico-personalization

    sudo systemctl enable pcscd
}

install_svc() {
    install diff-so-fancy
    install git
    install openssh
    install perl-term-readkey
}
