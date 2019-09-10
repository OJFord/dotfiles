highlight clear

let colors_name = 'mine'

highlight Boolean               None
highlight Character             None
highlight Conceal                                   ctermbg=Grey        ctermfg=Grey
highlight Conditional           None
highlight Constant                                                      ctermfg=DarkBlue
highlight Cursor                None
highlight CursorIM              None
highlight CursorColumn                              ctermbg=Grey
highlight CursorLine            cterm=Underline
highlight CursorLineNr                                                  ctermfg=DarkCyan
highlight Debug                 None
highlight Define                None
highlight Delimiter             None
highlight Directory                                                     ctermfg=DarkRed
highlight DiffAdd                                   ctermbg=DarkGreen   ctermfg=Black
highlight DiffChange                                ctermbg=DarkCyan    ctermfg=Black
highlight DiffDelete                                ctermbg=DarkBlue    ctermfg=Black
highlight DiffText              cterm=Bold          ctermbg=Cyan        ctermfg=Black
highlight EndOfBuffer           None
highlight Error                                     ctermbg=Blue        ctermfg=White
highlight ErrorMsg                                  ctermbg=DarkBlue    ctermfg=White
highlight Exception             None
highlight Float                 None
highlight Folded                cterm=Undercurl     ctermbg=None        ctermfg=DarkBlue
highlight FoldColumn                                ctermbg=None        ctermfg=DarkBlue
highlight Function              None
highlight Identifier            cterm=None                              ctermfg=DarkYellow
highlight Ignore                                                        ctermfg=White
highlight Include               None
highlight IncSearch             cterm=Reverse
highlight Keyword               None
highlight Label                 None
highlight Macro                 None
highlight MatchParen            cterm=Standout                          ctermfg=Yellow
highlight ModeMsg               cterm=Bold
highlight MoreMsg                                                       ctermfg=DarkGreen
highlight NonText                                                       ctermfg=Red
highlight Normal                None
highlight Number                None
highlight Operator              None
highlight PmenuSbar                                 ctermbg=DarkGrey
highlight PmenuThumb                                ctermbg=Black
highlight PreCondit             None
highlight PreProc                                                       ctermfg=DarkMagenta
highlight Question                                                      ctermfg=DarkGreen
highlight QuickFixLine          None
highlight Repeat                None
highlight Search                                    ctermbg=Cyan        ctermfg=Black
highlight SignColumn            None
highlight Special                                                       ctermfg=DarkMagenta
highlight SpecialChar           None
highlight SpecialComment        None
highlight SpecialKey                                                    ctermfg=DarkRed
highlight SpellBad              cterm=Undercurl     ctermbg=None        ctermfg=DarkRed
highlight SpellLocal                                ctermbg=Yellow
highlight SpellRare                                 ctermbg=DarkMagenta
highlight Statement                                                     ctermfg=DarkCyan
highlight StatusLineTerm        None
highlight StatusLineTermNC      None
highlight StorageClass          None
highlight String                None
highlight Structure             None
highlight TabLine               cterm=Underline     ctermbg=Grey        ctermfg=Black
highlight TabLineFill           cterm=Inverse
highlight TabLineSel            cterm=Bold
highlight Tag                   None
highlight Terminal              None
highlight Title                                                         ctermfg=DarkMagenta
highlight Todo                                      ctermbg=Cyan        ctermfg=Black
highlight Type                                                          ctermfg=DarkGreen
highlight TypeDef               None
highlight Underlined            cterm=Underline                         ctermfg=DarkMagenta
highlight Visual                cterm=Inverse
highlight VisualNOS             None
highlight WarningMsg                                                    ctermfg=DarkBlue
highlight WildMenu                                  ctermbg=Cyan        ctermfg=Black

if &background == "light"
highlight ColorColumn                               ctermbg=Grey        ctermfg=DarkGrey
highlight Comment                                                       ctermfg=Grey
highlight LineNr                                                        ctermfg=Grey
highlight Pmenu                                     ctermbg=Grey        ctermfg=Black
highlight PmenuSel                                  ctermbg=Black       ctermfg=Grey
highlight SpellCap                                  ctermbg=Grey        ctermfg=DarkGrey
highlight StatusLine            cterm=Bold          ctermbg=Grey        ctermfg=Black
highlight StatusLineNC                              ctermbg=Grey        ctermfg=DarkGrey
highlight VertSplit                                 ctermbg=Grey        ctermfg=DarkGrey
else " dark background
highlight ColorColumn                               ctermbg=DarkGrey    ctermfg=Grey
highlight Comment                                                       ctermfg=DarkGrey
highlight LineNr                                                        ctermfg=DarkGrey
highlight Pmenu                                     ctermbg=DarkGrey    ctermfg=White
highlight PmenuSel                                  ctermbg=White       ctermfg=DarkGrey
highlight SpellCap                                  ctermbg=DarkGrey    ctermfg=Grey
highlight StatusLine            cterm=Bold          ctermbg=DarkGrey    ctermfg=White
highlight StatusLineNC                              ctermbg=DarkGrey    ctermfg=Grey
highlight VertSplit                                 ctermbg=DarkGrey    ctermfg=Grey
endif
