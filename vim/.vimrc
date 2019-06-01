" No vi compatibility
if &compatible
    set nocompatible
endif

" Use XDG dir for .vim
exec 'set runtimepath='.$VIMDIR.','.$VIMRUNTIME

colorscheme mine

" Packages
exec 'set packpath='.&runtimepath
packloadall
helptags ALL
function PackAddFor(dir)
    for pkg in split(system('ls '.$VIMDIR.'/pack/'.a:dir.'/opt'))
        exec 'packadd '.pkg
    endfor
endfunction
autocmd FileType * call PackAddFor(&filetype)

" Use a POSIX shell to avoid confusing plugins
set shell=/bin/sh

" Semicolon -> :
nnoremap ; :
vnoremap ; :

" Plugin mappings
map <Leader> <Plug>(easymotion-prefix)
nnoremap <Leader>u :UndotreeToggle<CR>
nnoremap <Leader>d <Plug>(ale_go_to_definition)
nnoremap <C-P> :Files<CR>
nnoremap <C-L> :Commits<CR>
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>),
  \   1,
  \   {
  \     'options': '--delimiter=: --nth=4.. --preview='."'".
  \                   'file={1};'.
  \                   'context_start="$(expr {2} - 3)";'.
  \                   'top_ln="$(if [ $context_start -lt 1 ]; then echo 1; else echo $context_start; fi)";'.
  \                   'bat --color=always --style=plain --theme=TwoDark --highlight-line={2} --line-range="$top_ln:" "$file"'.
  \                "'"
  \   },
  \   <bang>0
  \ )
nnoremap <C-F> :Rg<CR>

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
augroup autofoldcolumn
  au!
  au CursorHold,BufWinEnter,WinEnter * AutoOrigamiFoldColumn
augroup END
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

" Maintain context when navigating near top/bottom
set scrolloff=5

" Wrap at 80
set textwidth=80

" Highlight search terms
autocmd TermResponse * nnoremap <Esc> :nohlsearch<Return><Esc>
set hlsearch
set incsearch
