#!/bin/bash
set -xeEuo pipefail

this_dir="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)"

ensure_aconfmgr() {
    if ! command -v aconfmgr; then
        pushd "$(mktemp -d)"
        sudo pacman -S wget
        wget 'https://aur.archlinux.org/cgit/aur.git/snapshot/aconfmgr-git.tar.gz'
        tar -xf ./*.tar.gz
        rm ./*.tar.gz
        cd ./*
        makepkg -si
        popd
    fi
}

ensure_brew() {
    if ! command -v brew >/dev/null; then
        touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
        softwareupdate --verbose --install "$(
            softwareupdate --list |
            grep "\* Command Line Tools" |
            sed -e 's/[[:space:]]*\*[[:space:]]//' \
        )"
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
}

case "$(uname -a)" in
    *Linux*arch*)
        ensure_aconfmgr
        aconfmgr apply
        ;;
    *Darwin*)
        ensure_brew
        brew bundle --file="$this_dir/Brewfile"
        ;;
    *)
        echo unknown uname
        exit 1
        ;;
esac

ln -sf "$this_dir/.profile" "$HOME/.profile"
