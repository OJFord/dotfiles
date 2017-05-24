" No vi compatibility
set nocompatible

" Use XDG dir for .vim
exec 'set runtimepath='.$VIMDIR.'/.vim,'.&runtimepath

" Use a POSIX shell to avoid confusing plugins
set shell=/bin/sh

if empty(glob($VIMDIR.'/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source ~/.vimrc
endif
call plug#begin()
" Aesthetic
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'ervandew/supertab'

" Navigation
Plug 'jeetsukumaran/vim-buffergator'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'tommcdo/vim-exchange'
Plug 'scrooloose/syntastic'
Plug 'tmhedberg/SimpylFold'
Plug 'hdima/python-syntax'
Plug 'davidhalter/jedi-vim'
Plug 'lervag/vimtex'
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

call plug#end()

" Semicolon -> :
nnoremap ; :
vnoremap ; :

" Plugin mappings
map <Leader> <Plug>(easymotion-prefix)
let g:buffergator_suppress_keymaps=1
nnoremap <Leader>bl :BuffergatorOpen<CR>
nnoremap <Leader>bn :BuffergatorMruCycleNext<CR>
nnoremap <Leader>bp :BuffergatorMruCyclePrev<CR>

" Backspace
set backspace=indent,eol,start

" Statusline
set laststatus=2
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
\ }
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols = get(g:, 'airline_symbols', {})
let g:airline_symbols.branch = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.readonly = ''

" Syntax
syntax enable
filetype plugin indent on
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
let g:solarized_termtrans=1
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
let g:buffergator_viewport_split_policy='T'

" Maintain context when navigating near top/bottom
set scrolloff=5

" Wrap at 80
set textwidth=80

" Highlight search terms
nnoremap <esc> :nohlsearch<CR><esc>
set hlsearch
