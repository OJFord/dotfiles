export CARGO_HOME="$XDG_CONFIG_HOME/cargo"
export PATH="$CARGO_HOME/bin:$PATH"
export RUSTUP_HOME="$CARGO_HOME/rustup"

rustup default stable 2>/dev/null >&2
if ! rustup component list --installed | rg '^clippy-' >/dev/null; then
    rustup component add clippy
fi
