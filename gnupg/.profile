for f in "$GNUPGHOME"/pub/*.pgp.pub.asc; do
    gpg --import <"$f" 2>/dev/null
done

if [ "$(uname -s)" = Darwin ]; then
    ln -sf "$(which pinentry-mac)" /usr/local/bin/pinentry
    ln -sf "$(which pinentry-mac)" /usr/local/opt/pinentry/bin/pinentry
fi
