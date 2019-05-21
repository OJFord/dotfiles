export PATH="$XDG_CONFIG_HOME/bin:$PATH"

for bin_dir in "$XDG_CONFIG_HOME"/*/bin; do
    export PATH="$bin_dir:$PATH"
done
