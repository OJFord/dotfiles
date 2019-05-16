" No vi compatibility
if &compatible
    set nocompatible
endif

" Use XDG dir for .vim
exec 'set runtimepath='.$VIMDIR.','.$VIMRUNTIME

" Packages
exec 'set packpath='.&runtimepath
packloadall
function PackAddFor(dir)
    for pkg in split(system('ls '.$VIMDIR.'/pack/'.a:dir.'/opt'))
        exec 'packadd '.pkg
    endfor
endfunction
autocmd FileType * call PackAddFor(&filetype)

colorscheme mine

" Use a POSIX shell to avoid confusing plugins
set shell=/bin/sh

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
let g:airline_theme='term'
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
    let g:ackprg = 'rg --vimgrep --no-heading'

    set grepprg=rg\ --vimgrep\ --color=never\ --no-heading
    set grepformat=%f:%l:%c:%m

    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
endif

" Split navigation
set winwidth=80
set winminwidth=0
set winminheight=0
nnoremap <C-J> <C-W><C-J><C-W>_
nnoremap <C-K> <C-W><C-K><C-W>_
nnoremap <C-L> <C-W><C-L><C-W>|
nnoremap <C-H> <C-W><C-H><C-W>|
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
