" start Pathogen
filetype plugin indent off
execute pathogen#infect()

" semicolon!
nnoremap ; :
vnoremap ; :

" syntax
syntax on
filetype plugin indent on

" solarized colours
set background=dark
let g:solarized_termcolors=256
color solarized

" vim-airline (statusline)
set laststatus=2
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts=1
