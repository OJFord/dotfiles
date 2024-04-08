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
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    eval "$(brew shellenv)"
    brew analytics off
}

case "$(uname -a)" in
    *Linux*arch*)
        ensure_aconfmgr
        aconfmgr apply
        ;;
    *Darwin*)
        ensure_brew
        brew bundle --file="$this_dir/Brewfile"
	"$this_dir/by-uname/Darwin/config.sh"
        ;;
    *)
        echo unknown uname
        exit 1
        ;;
esac

ln -sf "$this_dir/.profile" "$HOME/.profile"
pre-commit install --install-hooks # now before we error and start fixing things
source "$HOME/.profile"

if [ "$this_dir" != "$(realpath "$XDG_CONFIG_HOME")" ]; then
  ln -sf "$this_dir" "$XDG_CONFIG_HOME"
fi
