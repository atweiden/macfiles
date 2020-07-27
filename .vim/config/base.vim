" set leader to comma
let mapleader=","

" set localleader to space
let maplocalleader=" "

" map ; to :
nnoremap ; :
vnoremap ; :

" Ctrl-Q to quit
nnoremap <C-Q> :qall<CR>
cnoremap <C-Q> <C-C>:qall<CR>
inoremap <C-Q> <C-O>:qall<CR>
onoremap <C-Q> <ESC>:qall<CR>
vnoremap <C-Q> <ESC>:qall<CR>

" store backups in the same directory
set backupdir=$VIMPATH/.backups

" store swap files in the same directory
set directory=$VIMPATH/.swaps

" store undo files in the same directory
set undodir=$VIMPATH/.undo

" make directories if necessary
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif

" short messages
set shortmess=aIoO
"             |||
"             ||+----- Omit redundant messages
"             |+------ Don't give intro message when starting vim
"             +------- Abbreviate messages without loss of information

" turn on mouse in all modes
if has('mouse')
  set mouse=a
  set mousemodel=popup_setpos
endif

" use utf-8 without BOM
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set nobomb

" flush file to disk after writing for protection against data loss
set nofsync

" prefer blowfish2 encryption method
silent! set cryptmethod=blowfish2

" don't show active mode on last line, lightline has this covered
set noshowmode

" greatly restrict local .vimrc and .exrc files
set secure

" disable modelines, use securemodelines.vim instead
set nomodeline

" switching buffers
set switchbuf=useopen,usetab,newtab
"             |       |      |
"             |       |      +-------- Prefer opening quickfix windows in new tabs
"             |       +--------------- Consider windows in other tab pages wrt useopen
"             +----------------------- Jump to first open window with specified buffer

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
"                   |      |        +---------------- Position of Vim window
"                   |      +------------------------- All tab pages
"                   +-------------------------------- Size of Vim window

" configure viminfo then read from it
set viminfo='100,<50,s10,h,!
"           |    |   |   | |
"           |    |   |   | +--- Save and restore all-uppercase global variables
"           |    |   |   +----- Don't restore hlsearch on startup
"           |    |   +--------- Exclude registers greater than N Kb
"           |    +------------- Keep N lines for each register
"           +------------------ Keep marks for N files
if !has('nvim')
  if filereadable($HOME . '/.viminfo')
    rviminfo
  endif
else
  if filereadable($XDG_DATA_HOME . '/nvim/shada/main.shada')
    rshada
  endif
endif

" never write or update the contents of any buffer unless we say so
set noautowrite
set noautowriteall
set noautoread

" read unix, dos and mac file formats
set fileformats=unix,dos,mac

" save undo history to an undo file
set undofile

" allow N number of changes to be undone
set undolevels=500

" store N previous vim commands and search patterns
set history=500

" switch buffers without saving
set hidden

" write swap file every N characters
set updatecount=20

" do not redraw screen when executing macros
set lazyredraw

" indicates fast terminal connection
set ttyfast

if !has('nvim')
  " terminal type for mouse codes
  set ttymouse=xterm2

  " use option (alt) as meta key in macvim
  set macmeta
endif

" use histogram diff algorithm, indent heuristic for internal diff library
set diffopt+=algorithm:histogram
set diffopt+=indent-heuristic

" format lines with fmt
set formatprg=fmt

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
