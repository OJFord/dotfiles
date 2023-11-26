export VIMDIR="$XDG_CONFIG_HOME/vim"
export NVIMDIR="$XDG_CONFIG_HOME/nvim"
export VIMINIT="if !has(\"nvim\") | source $VIMDIR/vimrc | else | source $NVIMDIR/init.vim | endif"
cat > "$VIMDIR/env.conf" <<-EOF
	VIMDIR='$VIMDIR'
	VIMINIT='$VIMINIT'
EOF

if ! rustup component list --installed | rg '^rls-' >/dev/null; then
    rustup component add rls
fi
