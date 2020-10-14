if ! gpg --list-keys | grep 4373E81FEF601557A7AF34287B697680F0B1E873 >/dev/null; then
    curl 'https://keybase.io/OJFord/pgp_keys.asc' | gpg --import
fi

if [ "$(uname -s)" = Darwin ]; then
    ln -sf "$(which pinentry-mac)" /usr/local/bin/pinentry
    ln -sf "$(which pinentry-mac)" /usr/local/opt/pinentry/bin/pinentry
fi
