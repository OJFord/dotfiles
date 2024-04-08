export CARGO_HOME="$XDG_CONFIG_HOME/cargo"
export RUSTUP_HOME="$CARGO_HOME/rustup"

if ! command -v rustup >/dev/null; then
    rustup-init -y --no-modify-path
fi
rustup component add clippy 2>/dev/null
