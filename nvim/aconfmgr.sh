# shellcheck shell=bash
AddPackage --foreign neovim-nightly-bin # until v0.12 stable for vim.pack

AddPackage darkman
AddPackage fish
AddPackage just
AddPackage shellcheck

# Language servers
AddPackage gopls
AddPackage lua-language-server
AddPackage marksman
AddPackage --foreign nodejs-vls
AddPackage python-lsp-server
AddPackage python-lsp-black
AddPackage --foreign python-lsp-isort
AddPackage --foreign python-pylsp-mypy
AddPackage svelte-language-server
AddPackage --foreign sql-language-server
AddPackage --foreign terraform-ls
AddPackage texlab
AddPackage typescript-language-server
AddPackage typescript-svelte-plugin
AddPackage vscode-langservers-extracted
