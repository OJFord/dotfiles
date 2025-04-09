export PATH="$XDG_CONFIG_HOME/bin:$PATH"

for bin_dir in "$XDG_CONFIG_HOME"/*/bin "$XDG_CONFIG_HOME/by-uname/$(uname -s)/bin" "$XDG_CONFIG_HOME/by-hostname/$(uname -n)"; do
    export PATH="$bin_dir:$PATH"
done
