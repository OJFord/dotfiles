set runtimepath^=$VIMDIR
let &packpath = &runtimepath
exec 'source '.$VIMDIR.'/vimrc'
