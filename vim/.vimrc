" No vi compatibility
set nocompatible

" Use a POSIX shell to avoid confusing plugins
set shell=/bin/sh

call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/syntastic'
Plug 'tmhedberg/SimpylFold'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
call plug#end()

" Semicolon -> :
nnoremap ; :
vnoremap ; :

" Syntax
syntax enable
filetype plugin indent on
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Code folding
set foldmethod=syntax
nnoremap <space> za

" Solarized colours
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" Cursor
set ruler
set cursorline

" Soft tabs, 4sp
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Line numbers
set number

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
    cnoreabbrev ag Ack
    let g:ackprg = 'ag --vimgrep'

    set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep

    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
    let g:ctrlp_use_caching = 0
endif

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Splits open below/right
set splitbelow
set splitright

" Maintain context when navigating near top/bottom
set scrolloff=5

" Wrap at 80
set textwidth=80

" Highlight search terms
set hlsearch
nnoremap <esc> :nohl<return><esc>
