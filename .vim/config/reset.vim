vim9script

# don't load vendored defaults.vim
g:skip_defaults_vim = 1

# disable unnecessary default plugins
g:loaded_zip = 1
g:loaded_zipPlugin = 1
g:loaded_getscript = 1
g:loaded_getscriptPlugin = 1
g:loaded_vimball = 1
g:loaded_vimballPlugin = 1
g:loaded_2html_plugin = 1
g:loaded_logiPat = 1
g:loaded_man = 1
g:loaded_matchparen = 1
g:loaded_spellfile_plugin = 1
g:loaded_rrhelper = 1
g:loaded_netrw = 1
g:loaded_netrwPlugin = 1
g:loaded_netrwSettings = 1
g:loaded_netrwFileHandlers = 1

# don't use spacebar to push cursor right
nnoremap <space> <nop>
vnoremap <space> <nop>

# don't use backspace to push cursor left
nnoremap <BS> <nop>
vnoremap <BS> <nop>

# don't use ! to filter text lines through external program
nnoremap ! <nop>

# don't use # or * to search word under cursor
nnoremap # <nop>
vnoremap # <nop>
nnoremap g# <nop>
vnoremap g# <nop>
nnoremap * <nop>
vnoremap * <nop>
nnoremap g* <nop>
vnoremap g* <nop>

# don't use & to repeat last substitute
nnoremap & <nop>
vnoremap & <nop>
nnoremap g& <nop>
vnoremap g& <nop>

# don't use -/+ for line-wise navigation
nnoremap - <nop>
vnoremap - <nop>
nnoremap + <nop>
vnoremap + <nop>

# don't use = to indent
nmap = <nop>
vmap = <nop>

# don't use z for spelling
# see: |z|

# --- spelling {{{

# give spelling suggestions
nnoremap z= <nop>
vnoremap z= <nop>

# mark word as good spelled word
nnoremap zG <nop>
vnoremap zG <nop>

# mark word as wrong (bad) spelled word
nnoremap zW <nop>
vnoremap zW <nop>

# mark word as good spelled word
nnoremap zg <nop>
vnoremap zg <nop>

# undo |zw|
nnoremap zuw <nop>
vnoremap zuw <nop>

# undo |zg|
nnoremap zug <nop>
vnoremap zug <nop>

# undo |zW|
nnoremap zuW <nop>
vnoremap zuW <nop>

# undo |zG|
nnoremap zuG <nop>
vnoremap zuG <nop>

# mark word as wrong (bad) spelled word
nnoremap zw <nop>
vnoremap zw <nop>

# --- end spelling }}}

# don't use gQ to enter ex mode
nnoremap gQ <nop>

# don't use gq to format text
nnoremap gq <nop>

# don't use gw to format text
nnoremap gw <nop>

# don't use <C-A> for incrementing, interferes with tmux prefix
nnoremap <C-A> <nop>
vnoremap <C-A> <nop>
nnoremap g<C-A> <nop>
vnoremap g<C-A> <nop>

# don't use <C-X> for decrementing
nnoremap <C-X> <nop>
vnoremap <C-X> <nop>
nnoremap g<C-X> <nop>
vnoremap g<C-X> <nop>

# don't use <C-L> for redrawing screen
nnoremap <C-L> <nop>
vnoremap <C-L> <nop>

# don't use ZZ or ZQ for writing buffer, exiting
nmap ZZ <nop>
nmap ZQ <nop>

# don't press F1 for help
nnoremap <F1> <nop>
vnoremap <F1> <nop>
inoremap <F1> <nop>

# don't press K for manpage
nnoremap K <nop>
vnoremap K <nop>

# don't press M to position cursor on middle line of window
nnoremap M <nop>
vnoremap M <nop>

# don't use Ctrl-H to delete
inoremap <C-H> <nop>
cnoremap <C-H> <nop>
# don't use Ctrl-J to begin new line
inoremap <C-J> <nop>
# don't use Ctrl-J to start entered command
cnoremap <C-J> <nop>
# don't use Ctrl-K to input digraph
inoremap <C-K> <nop>
cnoremap <C-K> <nop>
# don't use Ctrl-L to insert ^L or switch to normal mode
inoremap <C-L> <nop>
# don't use Ctrl-L in pattern match entry
cnoremap <C-L> <nop>

# don't use Ctrl-E to insert character below cursor
inoremap <C-E> <nop>
# don't use Ctrl-Y to insert character above cursor
inoremap <C-Y> <nop>
# don't use Ctrl-A to insert previously inserted text
inoremap <C-A> <nop>
# don't use Ctrl-A to insert all names matching pattern in front of cursor
cnoremap <C-A> <nop>
# don't use Ctrl-@ to insert previously inserted text and stop insert
inoremap <C-@> <nop>

# don't use Ctrl-W to delete word before cursor
inoremap <C-W> <nop>
# don't use Ctrl-U to delete characters before cursor on current line
inoremap <C-U> <nop>

# don't use Shift-← to move cursor one word back
inoremap <S-Left> <nop>
cnoremap <S-Left> <nop>
# don't use Ctrl-← to move cursor one word back
inoremap <C-Left> <nop>
cnoremap <C-Left> <nop>
# don't use Shift-→ to move cursor one word forward
inoremap <S-Right> <nop>
cnoremap <S-Right> <nop>
# don't use Ctrl-→ to move cursor one word forward
inoremap <C-Right> <nop>
cnoremap <C-Right> <nop>
# don't use Shift-↑ to move window one page up
inoremap <S-Up> <nop>
# don't use Shift-↑ to recall older command from history
cnoremap <S-Up> <nop>
# don't use Shift-↓ to move window one page down
inoremap <S-Down> <nop>
# don't use Shift-↓ to recall older command from history
cnoremap <S-Down> <nop>

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
