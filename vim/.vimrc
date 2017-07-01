" No vi compatibility
set nocompatible

" Use XDG dir for .vim
exec 'set runtimepath='.$VIMDIR.'/.vim,'.&runtimepath

" Use a POSIX shell to avoid confusing plugins
set shell=/bin/sh

if empty(glob($VIMDIR.'/.vim/autoload/plug.vim'))
    silent !curl -fLo $VIMDIR/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source ~/.vimrc
endif
call plug#begin()
" Aesthetic
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'Yggdroot/indentLine'

" Navigation
Plug 'jeetsukumaran/vim-buffergator'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'godlygeek/tabular', {'for': 'markdown'}

" Editing
Plug 'ervandew/supertab'
Plug 'tpope/vim-commentary'
Plug 'tommcdo/vim-exchange'
Plug 'mbbill/undotree'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Multi-language
Plug 'Valloric/YouCompleteMe', {'do': './install.py --racer-completer'}
Plug 'w0rp/ale'
Plug 'bronson/vim-trailing-whitespace'

" Languages-specific
Plug 'python-mode/python-mode', {'for': 'python'}
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'hashivim/vim-terraform', {'for': 'terraform'}
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'chrisbra/csv.vim', {'for': 'csv'}
Plug 'elzr/vim-json', {'for': 'json'}
call plug#end()

" Semicolon -> :
nnoremap ; :
vnoremap ; :

" Plugin mappings
map <Leader> <Plug>(easymotion-prefix)
nnoremap <Leader>u :UndotreeToggle<CR>
nnoremap <Leader>y :YcmCompleter GoTo<CR>
nnoremap <Leader>p :CtrlP<CR>
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
autocmd BufNewFile,BufRead *.xonshrc set filetype=python
let g:ale_lint_on_text_changed=1
let g:ale_lint_on_save=1
let g:ale_open_list=1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Code folding
set foldmethod=syntax
set foldopen-=block
nnoremap <space> za

" Concealing
autocmd InsertEnter *.* set conceallevel=0
autocmd InsertLeave *.* set conceallevel=2

" Solarized colours
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

" Where am I
set ruler
set cursorline
set number

" Soft tabs, 4sp
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab
let g:indentLine_color_term=239
autocmd InsertEnter *.* let g:indentLine_char=''
autocmd InsertLeave *.* let g:indentLine_char='┊'

let g:ctrlp_working_path_mode='r' " Look for nearest repo
if executable('rg')
    cnoreabbrev rg Ack
    let g:ackprg = 'rg --vimgrep'

    set grepprg=rg\ --vimgrep\ --color=never
    set grepformat=%f:%l:%c:%m

    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
elseif executable('ag')
    cnoreabbrev ag Ack
    let g:ackprg = 'ag --vimgrep'

    set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep
    set grepformat=%f:%l:%c:%m,%f:%l:%m

    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
    let g:ctrlp_use_caching = 0
endif

" Split navigation
nnoremap ∆ <C-W><C-J> " (<Alt-J>)
nnoremap ˚ <C-W><C-K> " (<Alt-K>)
nnoremap ¬ <C-W><C-L> " (<Alt-L>)
nnoremap ˙ <C-W><C-H> " (<Alt-H>)
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
set incsearch
