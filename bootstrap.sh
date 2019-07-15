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
        for brewfile in $(find "$this_dir" -name Brewfile); do
		echo "Installing dependencies for $(basename "$(dirname "$brewfile")")"
            brew bundle --file="$brewfile"
        done
        ;;
    *)
        echo unknown uname
        exit 1
        ;;
esac

# Cleanup automatic dotfiles that either won't be used, or will move to XDG dir
#!FIXME: permission denied on `vmshare`, so `find` errors
set +e
rubbish="$(
    find "$HOME" -maxdepth 1 -name ".*" -not -wholename "$this_dir" -not -iname ".local" \
        2>/dev/null
)"
set -e
rm -rf $rubbish

# Link dotfiles for XDG naysayers
ln -sf "$this_dir/atom" "$HOME/.atom"
ln -sf "$this_dir/gnupg/ssh" "$HOME/.ssh"
ln -sf "$this_dir/chunkwm/config" "$HOME/.chunkwmrc"
ln -sf "$this_dir/skhd/config" "$HOME/.skhdrc"

if (uname -s) = "Linux"
    # Ensure new configuration is found on next login
    ln -sf "$this_dir/.profile" "$HOME/.profile"
end
