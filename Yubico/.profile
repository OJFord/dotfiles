if ! grep "^$USER:" /etc/u2f_mappings > /dev/null; then
    hostname="$(cat /etc/hostname)"
    echo 'Adding Yubikey to U2F mappings, touch may be required'
    pamu2fcfg --verbose -o "pam://$hostname" -i "pam://$hostname" >> /etc/u2f_mappings

# else the output should go on the end of the same line, colon separated, i.e. one line per user, but
# TODO: how to determine if a token for current key is already listed?
# https://github.com/Yubico/pam-u2f/issues/220
fi
