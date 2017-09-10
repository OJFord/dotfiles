#!/bin/sh
set -e

install_cli() {
    require OJFord/formulae/alacritty --HEAD
    require thefuck
    require fish

    exec fish "-c set -u fish_greeting"
}

install_dev_tools() {
    langs="$1"
    
    gnu_replacements=(
        binutils
        coreutils
        diffutils
        ed\ --with-default-names
        findutils\ --with-default-names
        gawk
        gnu-getopt
        gnu-indent\ --with-default-names
        gnu-sed\ --with-default-names
        gnu-tar\ --with-default-names
        gnu-which\ --with-default-names
        gnupg
        gnutls
        grep\ --with-default-names
        gzip
        screen
        watch
        wdiff\ --with-default-names
        wget
    )

    default_updates=(
        bash
        curl
        file-formula
        gdb
        git
        gpatch
        less
        m4
        make
        nano
        openssh
        perl
        python
        rsync
        svn
        unzip
        vim\ --with-override-system-vi
    )

    for package in "${gnu_replacements[@]}" "${default_updates[@]}"; do
        require "${package}"
    done

    require docker
    require docker-compose
    require dockutil
    require flycut
    require htop
    require ZloeSabo/nettools/httplab
    require irssi
    require jq
    require prettyping
    require ripgrep
    require terraform
    require vim
    require ZloeSabo/nettools/wuzz

    for lang in $langs; do
        eval "install_dev_tools_$lang"
    done
}

install_dev_tools_haskell() {
    require stack
}

install_dev_tools_python() {
    require flake8
    require mypy
    require python3

    pip3 install --upgrade pip setuptools
}

install_dev_tools_rust() {
    require rustup
    rustup-init -y --no-modify-path \
        --default-host x86_64-apple-darwin \
        --default-toolchain stable
}

install_dev_tools_shell() {
    require shellcheck
}

install_password_mgr() {
    require keybase
    require OJFord/formulae/passbase
}

install_security_key() {
    require gnupg
    require keybase
    require libu2f-host
    require libusb-compat
    require pam_yubico
    require pcsc-lite
    require pinentry-mac
    require yubikey-personalization

    sudo chown -R "$(whoami)" "$BOOTSTRAP_DIR/../gnupg"
    sudo chmod 600 "$BOOTSTRAP_DIR/../gnupg"/*
    sudo chmod 700 "$BOOTSTRAP_DIR/../gnupg"
    mkdir -p "$BOOTSTRAP_DIR/../gnupg/ssh"

    curl https://keybase.io/OJFord/pgp_keys.asc -o /tmp/keys.asc
    GNUPGHOME="$BOOTSTRAP_DIR/../gnupg" gpg --import /tmp/keys.asc
    sudo chmod 700 "$BOOTSTRAP_DIR/../gnupg"/*/

    killall gpg-agent ssh-agent scdaemon >/dev/null || true
}

install_svc() {
    require diff-so-fancy
    require git
    require openssh

    install_security_key
}
