#!/bin/sh
set -e

xrdb -load "$XDG_CONFIG_HOME/X/.Xresources"

ibus-daemon --daemonize --replace --xim
