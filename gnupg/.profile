export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"

if ! gpg --list-keys | grep 4373E81FEF601557A7AF34287B697680F0B1E873 >/dev/null; then
    curl 'https://keybase.io/OJFord/pgp_keys.asc' | gpg --import
fi
