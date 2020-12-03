let b:ale_linters = ['pyls']
let g:ale_python_pyls_config = {'pyls': {
\   "plugins": {
\     "autopep8": {
\         "enabled": v:false,
\     },
\     "black": {
\         "enabled": v:true,
\     },
\     "pyls_mypy": {
\         "enabled": v:true,
\         "live_mode": v:true,
\     },
\     "yapf": {
\         "enabled": v:false,
\     },
\   },
\ }}

let g:SimpylFold_docstring_preview = 1

highlight pythonSelf ctermfg=68 cterm=bold
