bw_dir="$XDG_CONFIG_HOME/Bitwarden CLI"

if [ ! -f "$bw_dir/apikey" ]; then
    cat <<-EOF | systemd-creds encrypt --user --name=bw-apikey - "$bw_dir/apikey"
		BW_CLIENTID="$(systemd-ask-password 'Bitwarden client id?')"
		BW_CLIENTSECRET="$(systemd-ask-password 'Bitwarden client secret?')"
EOF
fi

if [ ! -f "$bw_dir/password" ]; then
    systemd-ask-password 'Bitwarden master password?' \
        | systemd-creds encrypt --user --name=bw-password - "$bw_dir/password"
fi
