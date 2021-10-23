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

" Paste without manic indentation
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

" Semicolon -> :
nnoremap ; :
vnoremap ; :

" Plugin mappings
nmap s <Plug>(easymotion-jumptoanywhere)
nnoremap <Leader>u :UndotreeToggle<CR>
nnoremap <C-P> :GFiles --cached --others --exclude-standard<CR>
command! -bang -nargs=* BLines
  \ call fzf#vim#buffer_lines(
  \   {
  \     'options': '--delimiter="	" --preview-window="+{1}/2" --preview="bat --highlight-line={1} ' . expand('%:p') . '"'
  \   },
  \   <bang>0
  \ )
nmap f :BLines<CR>
nnoremap <C-C> :Commits<CR>
command! -bang -nargs=* Buffers
  \ call fzf#vim#buffers(
  \   {
  \     'options': '--delimiter="	" --preview="bat {-1}"'
  \   },
  \   <bang>0
  \ )
nnoremap <C-B> :Buffers<CR>
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>),
  \   1,
  \   {
  \     'options': '--delimiter=: --nth=4.. --preview-window="+{2}/2" --preview="bat --highlight-line={2} {1}"'
  \   },
  \   <bang>0
  \ )
nnoremap <C-F> :Rg<CR>

set wildmode=longest,list,full
set wildmenu

"LSP
set signcolumn=number
call system($VIMDIR.'/pack/all/start/language-client/install.sh')
let g:LanguageClient_loggingLevel = 'DEBUG'
let g:LanguageClient_loggingFile = '/tmp/vim-languageclient.log'
let g:LanguageClient_serverStderr = '/tmp/vim-languageclient.stderr'
let g:LanguageClient_rootMarkers = {
\ 'go': ['go.mod', 'go.sum', 'main.go'],
\ 'python': ['pyproject.toml', 'setup.cfg', 'setup.py', 'tox.ini'],
\ 'rust': ['Cargo.toml'],
\ 'svelte': ['svelte.config.js', 'package.json', 'yarn.lock'],
\ 'terraform': ['.terraform'],
\ 'vim': ['autoload', 'ftdetect', 'ftplugin'],
\ 'vue': ['package.json'],
\ }
let g:LanguageClient_serverCommands = {
\ 'go': ['gopls'],
\ 'python': ['pylsp', '--log-file=/tmp/python-languageserver.log', '--verbose'],
\ 'rust': ['rustup', 'run', 'stable', 'rls'],
\ 'svelte': ['svelteserver', '--stdio'],
\ 'terraform': ['terraform-ls', 'serve'],
\ 'vim': ['vim-language-server','--stdio'],
\ 'vue': ['vls', '--stdio'],
\ }
let g:LanguageClient_settingsPath = "$VIMDIR/lsp.json"
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
function! MyLangClientSelectionUI(source, sink) abort
  call fzf#run(fzf#wrap({
    \ 'source': a:source,
    \ 'sink': function(a:sink),
    \ 'options': '--delimiter=: --preview-window="+{2}/2" --preview="bat --highlight-line={2} {1}"',
  \ }))
endfunction
let g:LanguageClient_selectionUI = function('MyLangClientSelectionUI')
function! AfterFormat(...) abort
  noautocmd w
endfunction
autocmd BufWrite * call LanguageClient#textDocument_formatting({}, 'AfterFormat')

" Completions
set completeopt=longest,menuone
autocmd InsertEnter * call deoplete#enable()
"" C-j/k completion navigation
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "j"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "k"
"" Enter to accept
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
let g:SuperTabDefaultCompletionType = "<C-n>"

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

" Code folding
augroup autofoldcolumn
  au!
  au CursorHold,BufWinEnter,WinEnter * AutoOrigamiFoldColumn
augroup END
set foldmethod=syntax
set foldopen-=block
nnoremap <expr> <space> foldclosed(".") == -1 ? 'zc' : 'zv'

" Concealing
autocmd InsertEnter *.* set conceallevel=0
autocmd InsertLeave *.* set conceallevel=2
set concealcursor=

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
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Maintain context when navigating near top/bottom
set scrolloff=5

" Highlight search terms
nnoremap <Leader>l :nohlsearch<Return>
set hlsearch
set incsearch
