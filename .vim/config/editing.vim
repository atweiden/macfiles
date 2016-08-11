" always keep cursor in the same column if possible
set nostartofline

" enable virtual edit in visual block mode
set virtualedit=block

" no annoying error noises
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

" always show statusline
set laststatus=2

" don't highlight matching parens
set noshowmatch

" turn on wildmenu completion
set wildmenu
set wildmode=list:longest,full

" disable some filetypes for completion
" blocking possibly large directories that usually are
" not of interest will speed up plugins like Command-T
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

" copy indent from current line when starting a new line
set autoindent

" sets the width of a <Tab> character
set tabstop=2

" when enabled, causes spaces to be used instead of <Tab> characters
set expandtab

" when enabled, sets the amount of whitespace to be inserted/removed on <Tab> / <BS>
" if softtabstop < tabstop, and expandtab is disabled (with noexpandtab), vim will start <Tab>s with whitespace
" this initial whitespace will be dynamically converted to / from <Tab> characters as the indent level of 'tabstop' is reached / unreached
set softtabstop=2

" sets the amount of space to insert / remove while using indentation commands in normal mode (>, <)
set shiftwidth=2

" round indent to multiple of shiftwidth
set shiftround

" jump between the following characters that form pairs
set matchpairs+=<:>
set matchpairs+=«:»
set matchpairs+=「:」

" triple matching curly braces form a fold
set foldmethod=marker

" higher numbers close fewer folds, 0 closes all folds.
set foldlevel=1

" automatically open folds on these commands
set foldopen=insert,mark,percent,tag,undo

" deepest fold is 3 levels
set foldnestmax=3

" visually break lines
set wrap

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

" ignore case in search patterns
set ignorecase

" override the ignorecase option if the search pattern contains upper case characters
set smartcase

" adjust the case of the match depending on the typed text
set infercase

" save and restore session data
set sessionoptions+=blank,buffers,curdir,folds
"                   |     |       |      |
"                   |     |       |      +------- Manually created folds, opened/closed folds, local fold options
"                   |     |       +-------------- The current directory
"                   |     +---------------------- Hidden and unloaded buffers
"                   +---------------------------- Empty windows
set sessionoptions+=globals,help,localoptions,options
"                   |       |    |            |
"                   |       |    |            +--------- All options and mappings, global values for local options
"                   |       |    +---------------------- Options and mappings local to a window or buffer
"                   |       +--------------------------- The help window
"                   +----------------------------------- Global variables that start with an uppercase letter and contain at least one lowercase letter
set sessionoptions+=resize,tabpages,winpos,winsize
"                   |      |        |      |
"                   |      |        |      +--------- Window sizes
"                   |      |        +---------------- Position of the whole Vim window
"                   |      +------------------------- All tab pages
"                   +-------------------------------- Size of the Vim window

" automatic formatting options
set formatoptions=
set formatoptions+=r " Automatically insert the current comment leader after <Enter> in insert mode
set formatoptions+=o " Automatically insert the current comment leader after 'o' or 'O' in normal mode
set formatoptions+=q " Allow formatting of comments with gq
set formatoptions+=n " Recognize numbered lists when formatting text
set formatoptions+=2 " Use the indent of the second line of a paragraph for the rest of the paragraph instead of the first
set formatoptions+=l " Don't break long lines in insert mode
set formatoptions+=1 " Don't break a line after a one-letter word
set formatoptions+=j " Remove comment leader when joining two comments

" use ag/pt/ack for grepping if available
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --hidden\ --smart-case\ --skip-vcs-ignores\ --path-to-agignore=$HOME/.agignore
elseif executable('pt')
  set grepprg=pt\ --nogroup\ --nocolor\ --hidden\ --nocolor\ -e
elseif executable('ack')
  set grepprg=ack\ --nogroup\ --nocolor\ --nopager
endif

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
