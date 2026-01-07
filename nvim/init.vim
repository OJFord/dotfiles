set runtimepath^=$VIMDIR
let &packpath = &runtimepath
exec 'source '.$VIMDIR.'/vimrc'

lua require('packs').setup()

lua require('autocomplete').setup()
lua require('colour').setup()
lua require('finding').setup()
lua require('folds').setup()
lua require('lsp').setup()
lua require('splits').setup()
