#!/bin/sh
export XDG_CONFIG_HOME="$HOME/.config"
export XINITRC="$XDG_CONFIG_HOME/X/.xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X/.xserverrc"

export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
gpg-connect-agent /bye
gpg_agent_socket="$(gpgconf --list-dirs agent-ssh-socket)"
export SSH_AUTH_SOCK="$gpg_agent_socket"

export SHELL="fish"
export TERMINAL="alacritty"

export LANG="en_GB.UTF-8"
export LC_CTYPE="en_GB.UTF-8"

export VIMDIR="$XDG_CONFIG_HOME/vim"
export VIMRC="$VIMDIR/.vimrc"
export EDITOR="vim -u $VIMRC"
export VISUAL="vim -u $VIMRC"

export CARGO_HOME="$XDG_CONFIG_HOME/cargo"

export PATH="$XDG_CONFIG_HOME/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$CARGO_HOME/bin:$PATH"
export PATH="/usr/share/git/diff-highlight:$PATH"

exec startx "$XINITRC"
