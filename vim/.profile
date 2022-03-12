export VIMDIR="$XDG_CONFIG_HOME/vim"
export VIMRC="$VIMDIR/.vimrc"
export EDITOR="vim"

if ! rustup component list --installed | rg '^rls-' >/dev/null; then
    rustup component add rls
fi

(cd "$VIMDIR/pack/all/start/language-client" && ./install.sh >/dev/null)
