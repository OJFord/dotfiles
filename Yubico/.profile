if ! grep "^$USER:" /etc/u2f_mappings > /dev/null; then
    hostname="$(cat /etc/hostname)"
    echo 'Adding Yubikey to U2F mappings, touch may be required'
    pamu2fcfg --verbose -o "pam://$hostname" -i "pam://$hostname" >> /etc/u2f_mappings
fi
