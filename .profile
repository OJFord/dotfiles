#!/bin/sh
export XDG_CONFIG_HOME="$HOME/.config"
export XINITRC="$XDG_CONFIG_HOME/X/.xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X/.xserverrc"

export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
gpg-connect-agent /bye
gpg_agent_socket="$(gpgconf --list-dirs agent-ssh-socket)"
export SSH_AUTH_SOCK="$gpg_agent_socket"

export SHELL="fish"
export TERMINAL=alacritty

exec startx "$XINITRC"
