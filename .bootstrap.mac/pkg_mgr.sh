#!/bin/sh
set -e

install_pkg_mgr() {
    if ! which brew >/dev/null; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
}

require() {
    if ! brew install $*; then
        brew cask install $*
    fi
}

trust_require() {
    if ! brew install $*; then
        brew cask install $*
    fi
}

update() {
    brew update
}

upgrade() {
    brew upgrade
}
