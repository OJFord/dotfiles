#!/usr/bin/env bash
set -eEuo pipefail

echo -e '[delta]\n  dark = true' > "$XDG_CONFIG_HOME/git/delta-light-or-dark.config"
