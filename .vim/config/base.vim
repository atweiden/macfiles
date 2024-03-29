vim9script

# set leader to comma
g:mapleader = ","

# set localleader to space
g:maplocalleader = " "

# map ; to :
nnoremap ; :
vnoremap ; :

# Ctrl-Q to quit
nnoremap <C-Q> :qall<CR>
cnoremap <C-Q> <C-C>:qall<CR>
inoremap <C-Q> <C-O>:qall<CR>
onoremap <C-Q> <ESC>:qall<CR>
vnoremap <C-Q> <ESC>:qall<CR>

# Ctrl-Z to suspend in insert mode
inoremap <C-Z> <C-O>:stop<CR>

# store backups in the same directory
set backupdir=$VIMPATH/.backups

# store swap files in the same directory
set directory=$VIMPATH/.swaps

# store undo files in the same directory
set undodir=$VIMPATH/.undo

# make directories if necessary
if !isdirectory(expand(&backupdir))
  mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
  mkdir(expand(&directory), "p")
endif
if !isdirectory(expand(&undodir))
  mkdir(expand(&undodir), "p")
endif

# turn on mouse in all modes
if has('mouse')
  set mouse=a
  set mousemodel=popup_setpos
endif

# use utf-8 without BOM
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set nobomb

# flush file to disk after writing for protection against data loss
set nofsync

# prefer blowfish2 encryption method
silent! set cryptmethod=blowfish2

# greatly restrict local .vimrc and .exrc files
set secure

# disable modelines, use securemodelines.vim instead
set nomodeline

# switching buffers
set switchbuf=useopen,usetab,newtab
#             |       |      |
#             |       |      +-------- Prefer opening quickfix windows in new tabs
#             |       +--------------- Consider windows in other tab pages wrt useopen
#             +----------------------- Jump to first open window with specified buffer

# save and restore session data
set sessionoptions+=blank,buffers,curdir,folds
#                   |     |       |      |
#                   |     |       |      +------- Manually created folds, opened/closed folds, local fold options
#                   |     |       +-------------- The current directory
#                   |     +---------------------- Hidden and unloaded buffers
#                   +---------------------------- Empty windows
set sessionoptions+=globals,help,localoptions,options
#                   |       |    |            |
#                   |       |    |            +--------- All options and mappings, global values for local options
#                   |       |    +---------------------- Options and mappings local to a window or buffer
#                   |       +--------------------------- The help window
#                   +----------------------------------- Global variables that start with an uppercase letter and contain at least one lowercase letter
set sessionoptions+=resize,tabpages,winpos,winsize
#                   |      |        |      |
#                   |      |        |      +--------- Window sizes
#                   |      |        +---------------- Position of Vim window
#                   |      +------------------------- All tab pages
#                   +-------------------------------- Size of Vim window

# configure viminfo then read from it
set viminfo='100,<50,s10,h,!
#           |    |   |   | |
#           |    |   |   | +--- Save and restore all-uppercase global variables
#           |    |   |   +----- Don't restore hlsearch on startup
#           |    |   +--------- Exclude registers greater than N Kb
#           |    +------------- Keep N lines for each register
#           +------------------ Keep marks for N files
set viminfofile=$VIMPATH/viminfo
if filereadable(&viminfofile)
  rviminfo
endif

# never write or update the contents of any buffer unless we say so
set noautowrite
set noautowriteall
set noautoread

# always use unix-style line endings
set fileformat=unix

# read unix, dos and mac file formats
set fileformats=unix,dos,mac

# save undo history to an undo file
set undofile

# allow N number of changes to be undone
set undolevels=500

# store N previous vim commands and search patterns
set history=500

# switch buffers without saving
set hidden

# write swap file every N characters
set updatecount=20

# do not redraw screen when executing macros
set lazyredraw

# improve redraw performance
set ttyfast

# make syntax highlighting more robust post vim 8
set redrawtime=10000

# terminal type for mouse codes
silent! set ttymouse=xterm2

# use option (alt) as meta key in macvim
silent! set macmeta

# format lines with fmt
set formatprg=fmt

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
