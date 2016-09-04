" No vi compatibility
set nocompatible

" Prevent confusing plugins with Xonsh
set shell=/bin/bash

call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'ervandew/supertab'
call plug#end()

" Semicolon -> :
nnoremap ; :
vnoremap ; :

" Syntax
syntax on
filetype plugin indent on

" Code folding
set foldmethod=syntax
nnoremap <space> za

" Solarized colours
set background=dark
set t_Co=256
set term=xterm-256color
let g:solarized_termcolors=256
let g:solarized_termtrans=1 " fixes background in iTerm
let g:solarized_visibility="high"
let g:solarized_contrast="high"
colorscheme solarized

" Run backspace over newlines
set backspace=indent,eol,start

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
nnoremap <esc> :noh<return><esc>
