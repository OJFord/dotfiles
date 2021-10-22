# shellcheck shell=bash
shopt -s globstar
for c in "$XDG_CONFIG_HOME"/*/aconfmgr.sh; do
    >&2 echo "Loading $c"
    # shellcheck source=/dev/null
    . "$c"
done
