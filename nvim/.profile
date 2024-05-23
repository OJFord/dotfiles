export EDITOR=nvim
rustup component add rust-analyzer 2>/dev/null

darkman_dir="$XDG_CONFIG_HOME/vim/pack/neovim-only/opt/darkman.nvim"
(cd "$darkman_dir" && go build -o bin/darkman.nvim)

telescopefzf_dir="$XDG_CONFIG_HOME/vim/pack/neovim-only/opt/telescope-fzf-native.nvim"
(cd "$telescopefzf_dir" && make --quiet)
