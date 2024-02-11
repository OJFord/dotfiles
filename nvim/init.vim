set runtimepath^=$VIMDIR
let &packpath = &runtimepath
exec 'source '.$VIMDIR.'/vimrc'

for pkg in split(system('ls '.$VIMDIR.'/pack/neovim-only/opt'))
    exec 'packadd '.pkg
endfor

lua require('autocomplete').setup()
lua require('colour').setup()
lua require('folds').setup()
lua require('lsp').setup()
lua require('splits').setup()
