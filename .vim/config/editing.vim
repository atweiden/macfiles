" always keep cursor in the same column if possible
set nostartofline

" enable virtual edit in visual block mode
set virtualedit=block

" no annoying error noises
set belloff=all
set noerrorbells
set vb t_vb=

" use a dialog when an operation has to be confirmed
set confirm

" don't show us the command we're typing
set noshowcmd

" always report the number of lines changed
set report=0

" don't highlight the screen line or column
set nocursorline nocursorcolumn

" always show status line
set laststatus=2

" don't highlight matching parens
set noshowmatch

" turn on wildmenu completion
set wildmenu
if !has('nvim')
  set wildmode=list:longest,full
else
  " display wildmenu completion options in popup menu on neovim
  set wildmode=full
  set wildoptions+=pum
endif

" disable some filetypes for completion efficiency
set wildignore+=*.o,*.obj,*.dll,*.pyc
set wildignore+=*~,*.DS_Store
set wildignore+=.git/*,.subgit/*,.hg/*,.subhg/*,.svn/*
set wildignore+=*.gif,*.jpg,*.jpeg,*.png
set wildignore+=*.class,*.jar
set wildignore+=*.beam
set wildignore+=*.hi,*.p_hi,*.p_o

" give following files lower priority
set suffixes+=.bak,~,.swp,.o,.info,.aux
set suffixes+=.log,.dvi,.bbl,.blg,.brf
set suffixes+=.cb,.ind,.idx,.ilg,.inx
set suffixes+=.out,.toc,CVS/,tags

" case sensitive file completion
set nofileignorecase

" vertical diffsplit by default
set diffopt+=vertical

" split windows below and to the right of the current
set splitright
set splitbelow

" allow no height, no width windows
set winminheight=0
set winminwidth=0

" generous backspacing
set backspace=2

" number of screen lines around cursor
set scrolloff=8
set sidescrolloff=16
set sidescroll=1

" break lines at sensible place
set linebreak

" wrap on these chars
set whichwrap+=<,>,[,]

" indicate wrapped characters
set showbreak=⁍

" visually indent wrapped lines
if exists('+breakindent')
  set breakindent
  set breakindentopt=shift:2
endif

" wrap lines by default
set wrap

" prevent two spaces after punctuation on a line join
set nojoinspaces

" copy indent from current line when starting a new line
set autoindent

" sets the width of a <Tab> character
set tabstop=2

" when enabled, causes spaces to be used instead of <Tab> characters
set expandtab

" when enabled, sets the amount of whitespace to be inserted/removed on
" <Tab> / <BS>
"
" if softtabstop < tabstop, and expandtab is disabled (with noexpandtab),
" vim will start <Tab>s with whitespace
"
" this initial whitespace will be dynamically converted to / from <Tab>
" characters as the indent level of 'tabstop' is reached / unreached
set softtabstop=2

" sets the amount of space to insert / remove while using indentation
" commands in normal mode (>, <)
set shiftwidth=2

" round indent to multiple of shiftwidth
set shiftround

" triple matching curly braces form a fold
set foldmethod=marker

" higher numbers close fewer folds, 0 closes all folds
set foldlevel=1

" automatically open folds on these commands
set foldopen=insert,mark,percent,search,tag,undo

" when foldmethod is indent or syntax, don't fold more than N levels deep
set foldnestmax=3

" show the line number in front of each line
set number

" show relative line numbers
set relativenumber

" minimum number of columns to use for the line number
set numberwidth=1

" don't autowrap text as it's being inserted
set textwidth=0

" insert N pixel lines between characters
set linespace=1

" <Tab> in front of a line inserts blanks according to shiftwidth
set smarttab

" don't wrap searches around the end of the file
set nowrapscan

" search options: incremental search, highlight search
set incsearch
set hlsearch

" enable substitution live preview in neovim
if has('nvim')
  set inccommand=nosplit
endif

" ignore case in search patterns
set ignorecase

" override ignorecase option if search pattern contains upper case chars
set smartcase

" adjust case of match depending on typed text
set infercase

" maintain concealed chars on cursor line in normal, insert, visual mode
set concealcursor=niv

" set timeout value for mappings to 1s, keycodes to 1/20th of a second
set timeout
set nottimeout
set timeoutlen=1000
set ttimeoutlen=50

" automatic formatting options
augroup fmtopts
  autocmd!
  autocmd FileType * set formatoptions=rqn2l1j
"                                      |||||||
"                                      ||||||+----- Remove comment leader when joining two comments
"                                      |||||+------ Don't break line after one-letter word
"                                      ||||+------- Don't break long lines in insert mode
"                                      |||+-------- Use indent of second line of paragraph for rest of paragraph, not first
"                                      ||+--------- Recognize numbered lists when formatting text
"                                      |+---------- Allow formatting of comments with gq
"                                      +----------- Automatically insert current comment leader after <Enter> in insert mode
augroup END

" use rg/ag/pt/ack for grepping if available
if executable('rg')
  set grepprg =rg
  set grepprg+=\ --vimgrep
  set grepprg+=\ --no-heading
  set grepprg+=\ --color\ never
  set grepprg+=\ --hidden
  set grepprg+=\ --smart-case
  set grepprg+=\ --ignore-file\ $HOME/.config/search/ignore
  set grepprg+=\ --ignore-vcs
elseif executable('ag')
  set grepprg =ag
  set grepprg+=\ --nogroup
  set grepprg+=\ --nocolor
  set grepprg+=\ --hidden
  set grepprg+=\ --smart-case
  set grepprg+=\ --path-to-ignore\ $HOME/.config/search/ignore
  set grepprg+=\ --skip-vcs-ignores
elseif executable('pt')
  set grepprg =pt
  set grepprg+=\ --nogroup
  set grepprg+=\ --nocolor
  set grepprg+=\ --hidden
  set grepprg+=\ --nocolor
  set grepprg+=\ -e
elseif executable('ack')
  set grepprg =ack
  set grepprg+=\ --nogroup
  set grepprg+=\ --nocolor
  set grepprg+=\ --nopager
endif

" don't move back cursor one position upon esc
augroup cursorpos
  autocmd!
  autocmd InsertEnter * let b:curcol = col('.')
  autocmd CursorMovedI * let b:curcol = col('.')
  autocmd InsertLeave * if col('.') != b:curcol | call cursor(0, col('.') + 1) | endif
augroup END

" return to last edit position
augroup cursormem
  autocmd!
  autocmd BufReadPost * call ReturnToLastEditPosition()
augroup END

" periodically check for/warn about external changes to buffer
augroup checktimestamp
  autocmd!
  autocmd BufEnter,BufWritePost,CursorHold,CursorHoldI,FocusGained <buffer>
    \ silent! checktime
augroup END

" write file and create its parent directories simultaneously
augroup easydir
  autocmd!
  autocmd BufWritePre,FileWritePre * call MkdirP(expand('<afile>:p:h'), v:cmdbang)
augroup END

" disable spell check
set nospell

" don't download spell files from the internet
let g:spellfile_URL = '/usr/share/vim/vimfiles/spell'

" words for <C-X><C-K> completion
"set dictionary=/usr/share/dict/words

" lower maximum height of popup menu
set pumheight=20

" make help window more likely to open at half existing window height
set helpheight=12

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
