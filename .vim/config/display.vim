" clear cursor styles
set guicursor=

" disable error noises
set belloff=all
set noerrorbells
set vb t_vb=

" number of screen lines around cursor
set scrolloff=8
set sidescrolloff=16
set sidescroll=1

" show the line number in front of each line
set number

" show relative line numbers
set relativenumber

" minimum number of columns to use for the line number
set numberwidth=1

" indicate wrapped characters
set showbreak=⁍

" don't highlight screen line or column
set nocursorcolumn
set nocursorline

" limit command line messages
set shortmess=acFIoO
"             ||||||
"             |||||+--- Overview previous message when reading file
"             ||||+---- Omit redundant messages
"             |||+----- Don't show intro message when starting vim
"             ||+------ Don't show filename in command line bar
"             |+------- Don't show |ins-completion-menu| messages
"             +-------- Abbreviate messages without loss of information

" always show status line
set laststatus=2

" don't show active mode on last line, status line has this covered
set noshowmode

" don't show line/column number absent status line
set noruler

" don't highlight matching parens
set noshowmatch

" highlight search pattern matches
set hlsearch

" show search pattern matches during pattern entry
set incsearch

" allow no height, no width windows
set winminheight=0
set winminwidth=0

" lower maximum height of popup menu
set pumheight=20

" make help window more likely to open at half existing window height
set helpheight=12

" highlighting {{{

function! Highlight() abort
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
  highlight CursorLine term=NONE cterm=NONE ctermbg=234 gui=NONE guibg=#FFFCFA
  highlight clear CursorColumn
  highlight CursorColumn term=NONE cterm=NONE ctermbg=234 gui=NONE guibg=#FFFCFA
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

  " whitespace
  " vim uses hl-SpecialKey for nbsp, space, tab and trail
  highlight clear SpecialKey
  highlight SpecialKey ctermfg=234 guifg=#F4F4F4
  " neovim uses hl-WhiteSpace for nbsp, space, tab and trail
  highlight clear WhiteSpace
  highlight WhiteSpace ctermfg=234 guifg=#F4F4F4

  " spelling
  highlight clear SpellBad
  highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
  highlight clear SpellCap
  highlight SpellCap term=underline cterm=underline
  highlight clear SpellRare
  highlight SpellRare term=underline cterm=underline
  highlight clear SpellLocal
  highlight SpellLocal term=underline cterm=underline

  " diff text
  highlight clear DiffAdd
  highlight link DiffAdd GitGutterAdd
  highlight clear DiffChange
  highlight link DiffChange GitGutterText
  highlight clear DiffDelete
  highlight link DiffDelete GitGutterDelete
  highlight clear DiffText
  highlight link DiffText GitGutterChange
endfunction

augroup highlight
  autocmd!
  autocmd ColorScheme * call Highlight()
augroup END

" turn off any existing search
augroup searchhighlight
  autocmd!
  autocmd VimEnter * nohlsearch
augroup END

" conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" colorscheme
let g:seoul256_background = 233
let g:seoul256_light_background = 256
silent! colorscheme seoul256

" end highlighting }}}
" window title {{{

set title
if has('title') && (&title || has('gui_running'))
  set titlestring=
  " file name
  set titlestring+=%f
  " flags
  set titlestring+=\ %h%m%r%w
  " program name
  set titlestring+=\ \|\ %{v:progname}
  " working directory
  set titlestring+=\ \|\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}
endif

" end window title }}}
" macvim {{{

if has('gui_running')
  " light colorscheme
  silent! colorscheme seoul256-light
  highlight clear Cursor
  highlight Cursor guifg=NONE guibg=#FFEADF
  highlight clear iCursor
  highlight iCursor guifg=#98C798 guibg=#98C798
  highlight clear vCursor
  highlight vCursor guifg=white guibg=#5FAFAF
  highlight clear rCursor
  highlight rCursor guifg=black guibg=#79C579
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
  " use monolisa font
  set guifont=MonoLisa:h24
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
  " don't show statusline
  set laststatus=0
  " configure seoul256-light :terminal colors
  let g:terminal_ansi_colors = [
      \ '#4e4e4e',
      \ '#af5f5f',
      \ '#5f885f',
      \ '#af8760',
      \ '#5f87ae',
      \ '#875f87',
      \ '#5f8787',
      \ '#e4e4e4',
      \ '#3a3a3a',
      \ '#870100',
      \ '#005f00',
      \ '#d8865f',
      \ '#0087af',
      \ '#87025f',
      \ '#008787',
      \ '#eeeeee'
      \ ]
  " display ligatures in macvim
  set macligatures
  " render text a bit lighter in macvim
  set macthinstrokes
  " don't setup bespoke meta-key bindings
  let macvim_skip_cmd_opt_movement = 1
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
  " enable substitution live preview
  set inccommand=nosplit
endif

" end neovim }}}
" listchars {{{

" align cursor position flush with line beginnings having leading tabs
" while using nathanaelkane/vim-indent-guides to highlight indentation:
" - show listchars
" - set tab listchar to blank (`\ `)
" - enable nathanaelkane/vim-indent-guides
"
" but default to minimalist approach for rendering indentation:
" - use ┊ for tui
" - use ⎸for gui
" - highlight SpecialKey/WhiteSpace ctermfg=234 guifg=#F4F4F4 for vim/nvim
"
" because:
" - dotted variant looks great and is significantly easier to read on tui
" - solid thin vertical bar variant allows lighter highlight color on gui
" - approach more closely resembles default experience in other editors
"
" and toggle between minimalism and nathanaelkane/vim-indent-guides with:
"
"     :ToggleIndentGuides
"
" see also: ⸫,⸪,⸬,⋮,⫶,ⵗ,⦙,⁞,⦚,¦,┆,┊,▏,│,⎸
set list
call SetListCharsTabVisible()
call SetListCharsRemaining()

" end listchars }}}
" screen {{{

" turn off syntax coloring of long lines
set synmaxcol=200

" start parsing syntax 75 lines prior to current line
augroup syntaxsyncminlines
  autocmd!
  autocmd Syntax * syntax sync minlines=75
augroup END

" readjust window sizing
augroup autoresize
  autocmd!
  autocmd VimResized * :wincmd =
augroup END

" fix background color bleed in tmux/screen
set t_ut=""

" end screen }}}

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
