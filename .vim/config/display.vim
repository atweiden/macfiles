set t_Co=256
set background=dark
let g:seoul256_background = 233
let g:seoul256_light_background = 256
silent! colorscheme seoul256
set guicursor=

" window title {{{

set title
if has('title') && (has('gui_running') || &title)
  set titlestring=
  " file name
  set titlestring+=%f\
  " flags
  set titlestring+=%h%m%r%w
  " program name
  set titlestring+=\ \|\ %{v:progname}
  " working directory
  set titlestring+=\ \|\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}
endif

" end window title }}}

" macvim {{{

if has('gui_running')
  " light colorscheme
  set background=light
  silent! colorscheme seoul256-light
  highlight clear Cursor
  highlight Cursor guifg=NONE guibg=#E3E7E4
  highlight clear iCursor
  highlight iCursor guifg=#87AF87 guibg=#87AF87
  highlight clear vCursor
  highlight vCursor guifg=white guibg=#5FAFAF
  highlight clear rCursor
  highlight rCursor guifg=black guibg=#DF005F
  highlight clear oCursor
  highlight oCursor guifg=black guibg=gray
  " set normal mode cursor to unblinking Cursor highlighted block
  set guicursor+=n:blinkon0-block-Cursor
  " set insert and command line mode cursor to 25% width unblinking iCursor highlighted block
  set guicursor+=i-c:blinkon0-ver25-iCursor
  " set visual mode cursor to unblinking vCursor highlighted block
  set guicursor+=v:blinkon0-block-vCursor
  " set replace mode cursor to unblinking rCursor highlighted block
  set guicursor+=r:blinkon0-block-rCursor
  " set operator pending mode cursor to 50% height unblinking oCursor highlighted block
  set guicursor+=o:blinkon0-hor50-oCursor
  " no menu bar
  set guioptions-=m
  " no toolbar
  set guioptions-=T
  " no right-hand scrollbar
  set guioptions-=r
  set guioptions-=R
  " no left-hand scrollbar
  set guioptions-=l
  set guioptions-=L
  " use console style tabbed interface
  set guioptions-=e
  " use console dialogs instead of popups
  set guioptions+=c
  " use lightline-compatible monaco
  set guifont=Monaco\ for\ Powerline:h24
  " allow macvim window to occupy whole screen
  set guiheadroom=0
  " no visual bell
  augroup errorbells
    autocmd!
    autocmd GUIEnter * set vb t_vb=
  augroup END
  " resize font
  noremap <silent> <M--> :Smaller<CR>
  noremap <silent> <M-+> :Bigger<CR>
  " paste selection with <S-Ins>
  inoremap <S-Insert> <MiddleMouse>
  cnoremap <S-Insert> <MiddleMouse>
endif

" end macvim }}}

" neovim {{{

if has('nvim')
  " set all cursors to 20% height unblinking block by default
  set guicursor+=a:blinkon0-hor20
  " set insert mode cursor to 25% width unblinking block
  set guicursor+=i:blinkon0-ver25
  " set :terminal cursor to URxvt-like underline
  highlight clear TermCursor
  highlight TermCursor ctermfg=red cterm=underline gui=underline
  highlight clear TermCursorNC
  highlight TermCursorNC ctermfg=red cterm=underline gui=underline
endif

" end neovim }}}

" highlighting {{{

" turn off any existing search
augroup searchhighlight
  autocmd!
  autocmd VimEnter * nohlsearch
augroup END

" searches
highlight clear Search
highlight Search term=bold cterm=bold ctermfg=0 ctermbg=116 gui=bold guifg=black guibg=#97DDDF
highlight clear IncSearch
highlight IncSearch term=bold cterm=bold ctermfg=0 ctermbg=217 gui=bold guifg=black guibg=#FFBFBD

" matching parens
highlight clear MatchParen
highlight MatchParen term=bold,NONE cterm=bold,NONE ctermfg=179 gui=bold,NONE guifg=#D7AF5F

" cursor line and column
highlight clear CursorLine
highlight CursorLine term=NONE cterm=NONE ctermbg=234 gui=NONE guibg=#E3E7E4
highlight clear CursorColumn
highlight CursorColumn term=NONE cterm=NONE ctermbg=234 gui=NONE guibg=#E3E7E4
highlight clear ColorColumn
highlight ColorColumn term=NONE cterm=NONE ctermbg=95 gui=NONE guibg=#875F5F

" error, warning and mode messages
highlight clear Error
highlight Error ctermfg=gray ctermbg=NONE guifg=gray guibg=NONE
highlight clear ErrorMsg
highlight ErrorMsg ctermfg=gray ctermbg=NONE guifg=gray guibg=NONE
highlight clear WarningMsg
highlight ErrorMsg ctermfg=gray ctermbg=NONE guifg=gray guibg=NONE
highlight clear ModeMsg
highlight ModeMsg ctermfg=gray ctermbg=NONE guifg=gray guibg=NONE

" question and more messages
highlight clear Question
highlight Question term=standout ctermfg=179 gui=bold guifg=#4E4E43
highlight clear MoreMsg
highlight MoreMsg term=bold cterm=bold ctermfg=179 gui=bold guifg=#4E4E43

" directories
highlight clear Directory
highlight Directory term=bold cterm=bold ctermfg=110 gui=bold guifg=#87AFD7

" wild menu completion
highlight clear StatusLine
highlight StatusLine term=reverse cterm=reverse ctermfg=234 ctermbg=242 gui=reverse guifg=#FFFFFF guibg=#B2B2B2
highlight clear WildMenu
highlight WildMenu term=bold cterm=bold ctermfg=87 ctermbg=234 gui=bold guifg=#D8AF5F guibg=#FFFFFF

" spelling
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}'

" don't distinguish between delete, add and change using bright colors,
" because:
"
" - add: appears opposite filler markers
" - delete: appears opposite filler markers
" - change: appears highlighted in changed portion of line
highlight DiffAdd ctermbg=0
highlight DiffDelete ctermbg=0
highlight DiffChange ctermbg=0

" use reverse foreground colors for +legibility (-consistency of color)
highlight DiffText cterm=reverse ctermbg=none

" end highlighting }}}

" show listchars {{{

set nolist
set listchars =tab:▷⋅
set listchars+=extends:›
set listchars+=precedes:‹
set listchars+=nbsp:·
set listchars+=trail:·

" end show listchars }}}

" screen {{{

" turn off syntax coloring of long lines
set synmaxcol=200

" readjust window sizing
augroup autoresize
  autocmd!
  autocmd VimResized * :wincmd =
augroup END

" fix background color bleed in tmux / screen
set t_ut=""

" end screen }}}

" timeout {{{

set timeout
set nottimeout
set timeoutlen=1000
set ttimeoutlen=50

" end timeout }}}

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
