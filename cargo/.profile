export CARGO_HOME="$XDG_CONFIG_HOME/cargo"
export RUSTUP_HOME="$CARGO_HOME/rustup"

rustup component add clippy 2>/dev/null
