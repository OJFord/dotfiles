for c in $(find "$XDG_CONFIG_HOME/" -name aconfmgr.sh); do
    >&2 echo "Loading $c"
    # shellcheck source=/dev/null
    . "$c"
done
