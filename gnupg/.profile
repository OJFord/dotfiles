export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
echo "GNUPGHOME=$GNUPGHOME" > "$GNUPGHOME/env.conf"

chmod 0700 "$GNUPGHOME"

for f in "$GNUPGHOME"/pub/*.pgp.pub.asc; do
    gpg --import <"$f" 2>/dev/null
done

if [ "$(uname -s)" = Darwin -a ! -e /usr/local/bin/pinentry-qt ]; then
    echo Setting symlink to pinentry-mac for gpg-agent
    sudo ln -sf "$(which pinentry-mac)" /usr/local/bin/pinentry-qt
fi
