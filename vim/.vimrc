" No vi compatibility
set nocompatible

" Prevent confusing plugins with Xonsh
set shell=/bin/bash

call plug#begin()
Plug 'altercation/vim-colors-solarized'
call plug#end()

" Semicolon -> :
nnoremap ; :
vnoremap ; :

" Syntax
syntax on
filetype plugin indent on

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

" Tab completion
"  - will insert tab at beginning of line,
"  - will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
    " ag is fast enough that CtrlP doesn't need to cache
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
