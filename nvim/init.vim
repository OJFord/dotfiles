set runtimepath^=$VIMDIR
let &packpath = &runtimepath
exec 'source '.$VIMDIR.'/vimrc'

for pkg in split(system('ls '.$VIMDIR.'/pack/neovim-only/opt'))
    exec 'packadd '.pkg
endfor

lua require('autocomplete')
lua require('colour')
lua require('lsp')
lua require('splits')