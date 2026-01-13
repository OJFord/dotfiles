credstore="$XDG_CONFIG_HOME/credstore.encrypted"

if [ ! -f "$credstore/bw-client-id" ]; then
    systemd-ask-password 'Bitwarden client id?' \
        | systemd-creds encrypt --user --name=bw-client-id - "$credstore/bw-client-id"
fi

if [ ! -f "$credstore/bw-client-secret" ]; then
    systemd-ask-password 'Bitwarden client secret?' \
        | systemd-creds encrypt --user --name=bw-client-secret - "$credstore/bw-client-secret"
fi

if [ ! -f "$credstore/bw-password" ]; then
    systemd-ask-password 'Bitwarden master password?' \
        | systemd-creds encrypt --user --name=bw-password - "$credstore/bw-password"
fi
