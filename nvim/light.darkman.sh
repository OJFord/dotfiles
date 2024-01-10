#!/bin/sh
set -eu

nvr --serverlist | xargs -I@ nvr --servername='@' -cc 'set background=light'
