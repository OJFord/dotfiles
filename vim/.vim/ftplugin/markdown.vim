setlocal nonumber
setlocal spell

setlocal textwidth=0
setlocal wrap
setlocal linebreak

let g:vim_markdown_math=1

noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$

let pandoc_settings = "markdown+backtick_code_blocks+fenced_code_attributes-simple_tables+pipe_tables"
command! -buffer -range=% Lint let myview = winsaveview() |
  \ execute <line1> . "," . <line2> . "!pandoc --wrap=none --to=".pandoc_settings |
  \ call winrestview(myview)

autocmd! BufWritePost *.md !pandoc -V geometry:margin=1in <afile> -o %:r.pdf
