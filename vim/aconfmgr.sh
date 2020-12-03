# shellcheck shell=bash
AddPackage vim

# Bindings/plugins
AddPackage bat
AddPackage fd
AddPackage fzf
AddPackage ripgrep
AddPackage python-pynvim

# Language servers
AddPackage gopls
AddPackage --foreign nodejs-vls
AddPackage python-language-server
AddPackage --foreign python-language-server-black
AddPackage --foreign pyls-mypy
rustup component add rls
AddPackage --foreign terraform-ls
