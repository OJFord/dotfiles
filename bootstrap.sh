#!/bin/sh
set -e
this_dir="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)"

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
    *Darwin*)
        ensure_brew
        find "$this_dir" -name Brewfile | while IFS= read -r brewfile; do
            echo "Installing dependencies for $(basename "$(dirname "$brewfile")")"
            brew bundle --file="$brewfile"
        done
        ;;
    *)
        echo unknown uname
        exit 1
        ;;
esac

ln -sf "$this_dir/.profile" "$HOME/.profile"
