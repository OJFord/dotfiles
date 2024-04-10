#!/usr/bin/env bash
set -eEuo pipefail

sketchybar --set "$NAME" label="$(date '+%H:%M')"
