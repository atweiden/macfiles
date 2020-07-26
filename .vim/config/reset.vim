" disable unnecessary default plugins
let g:loaded_gzip = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1
let g:loaded_rrhelper = 1
let g:loaded_2html_plugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1
let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_logipat = 1
let g:loaded_man = 1

" don't use spacebar to push cursor right
nnoremap <space> <nop>
vnoremap <space> <nop>

" don't use backspace to push cursor left
nnoremap <BS> <nop>
vnoremap <BS> <nop>

" don't use # or * to search word under cursor
nnoremap # <nop>
vnoremap # <nop>
nnoremap * <nop>
vnoremap * <nop>

" don't use & to repeat last substitute
nnoremap & <nop>
vnoremap & <nop>
nnoremap g& <nop>
vnoremap g& <nop>

" don't use -/+ for line-wise navigation
nnoremap - <nop>
vnoremap - <nop>
nnoremap + <nop>
vnoremap + <nop>

" don't use = to indent
nmap = <nop>
vmap = <nop>

" don't use z for folding, redrawing, scrolling or spelling
" see: |z|

" --- folding {{{

" open a closed fold or close an open fold recursively
nnoremap zA <nop>
vnoremap zA <nop>

" close folds recursively
nnoremap zC <nop>
vnoremap zC <nop>

" delete folds recursively
nnoremap zD <nop>
vnoremap zD <nop>

" eliminate all folds
nnoremap zE <nop>
vnoremap zE <nop>

" create a fold for N lines
" noremap because it appears to utilize |Operator-pending-mode|
noremap zF <nop>

" set 'foldlevel' to zero
nnoremap zM <nop>
vnoremap zM <nop>

" set 'foldenable'
nnoremap zN <nop>
vnoremap zN <nop>

" open folds recursively
nnoremap zO <nop>
vnoremap zO <nop>

" set 'foldlevel' to the deepest fold
nnoremap zR <nop>
vnoremap zR <nop>

" re-apply 'foldlevel'
nnoremap zX <nop>
vnoremap zX <nop>

" open a closed fold, close an open fold
nnoremap za <nop>
vnoremap za <nop>

" close a fold
nnoremap zc <nop>
vnoremap zc <nop>

" delete a fold
nnoremap zd <nop>
vnoremap zd <nop>

" create a fold for Nmove text
" noremap because it appears to utilize |Operator-pending-mode|
noremap zf <nop>

" toggle 'foldenable'
nnoremap zi <nop>
vnoremap zi <nop>

" move to the start of the next fold
nnoremap zj <nop>
vnoremap zj <nop>

" move to the end of the previous fold
nnoremap zk <nop>
vnoremap zk <nop>

" subtract one from 'foldlevel'
nnoremap zm <nop>
vnoremap zm <nop>

" reset 'foldenable'
nnoremap zn <nop>
vnoremap zn <nop>

" open fold
nnoremap zo <nop>
vnoremap zo <nop>

" add one to 'foldlevel'
nnoremap zr <nop>
vnoremap zr <nop>

" open enough folds to view the cursor line
nnoremap zv <nop>
vnoremap zv <nop>

" re-apply 'foldlevel' and do "zv"
nnoremap zx <nop>
vnoremap zx <nop>

" --- end folding }}}
" --- redrawing {{{

" redraw, cursor line to top of window, cursor on first non-blank
" noremap because it appears to utilize |Operator-pending-mode|
noremap z<CR> <nop>

" cursor on line N (default line below window), otherwise like "z<CR>"
" noremap because it appears to utilize |Operator-pending-mode|
noremap z+ <nop>

" redraw, cursor line at bottom of window, cursor on first non-blank
nnoremap z- <nop>
vnoremap z- <nop>

" redraw, cursor line to center of window, cursor on first non-blank
nnoremap z. <nop>
vnoremap z. <nop>

" cursor on line N (default line above window), otherwise like "z-"
" noremap because it appears to utilize |Operator-pending-mode|
noremap z^ <nop>

" redraw, cursor line at bottom of window
nnoremap zb <nop>
vnoremap zb <nop>

" redraw, cursor line at top of window
nnoremap zt <nop>
vnoremap zt <nop>

" redraw, cursor line at center of window
nnoremap zz <nop>
vnoremap zz <nop>

" --- redrawing }}}
" --- scrolling {{{

" when 'wrap' off scroll half a screenwidth to the right
nnoremap zH <nop>
vnoremap zH <nop>

" when 'wrap' off scroll half a screenwidth to the left
nnoremap zL <nop>
vnoremap zL <nop>

" when 'wrap' off scroll horizontally to position the cursor at the end
" (right side) of the screen
nnoremap ze <nop>
vnoremap ze <nop>

" when 'wrap' off scroll screen N characters to the right
" noremap because it appears to utilize |Operator-pending-mode|
noremap zh <nop>

" when 'wrap' off scroll screen N characters to the left
" noremap because it appears to utilize |Operator-pending-mode|
noremap zl <nop>

" when 'wrap' off scroll horizontally to position the cursor at the start
" (left side) of the screen
nnoremap zs <nop>
vnoremap zs <nop>

" same as "zh"
" noremap because it appears to utilize |Operator-pending-mode|
noremap z<Left> <nop>

" same as "zl"
" noremap because it appears to utilize |Operator-pending-mode|
noremap z<Right> <nop>

" --- end scrolling }}}
" --- spelling {{{

" give spelling suggestions
nnoremap z= <nop>
vnoremap z= <nop>

" mark word as good spelled word
nnoremap zG <nop>
vnoremap zG <nop>

" mark word as wrong (bad) spelled word
nnoremap zW <nop>
vnoremap zW <nop>

" mark word as good spelled word
nnoremap zg <nop>
vnoremap zg <nop>

" undo |zw|
nnoremap zuw <nop>
vnoremap zuw <nop>

" undo |zg|
nnoremap zug <nop>
vnoremap zug <nop>

" undo |zW|
nnoremap zuW <nop>
vnoremap zuW <nop>

" undo |zG|
nnoremap zuG <nop>
vnoremap zuG <nop>

" mark word as wrong (bad) spelled word
nnoremap zw <nop>
vnoremap zw <nop>

" --- end spelling }}}

" don't let netrw vmap gx
vnoremap gx <nop>

" don't use <C-A> for incrementing, interferes with tmux prefix
nnoremap <C-A> <nop>
vnoremap <C-A> <nop>
nnoremap g<C-A> <nop>
vnoremap g<C-A> <nop>

" don't use <C-X> for decrementing
nnoremap <C-X> <nop>
vnoremap <C-X> <nop>
nnoremap g<C-X> <nop>
vnoremap g<C-X> <nop>

" don't use <C-L> for redrawing screen
nnoremap <C-L> <nop>
vnoremap <C-L> <nop>

" don't use ZZ or ZQ for writing buffer, exiting
nmap ZZ <nop>
nmap ZQ <nop>

" don't press F1 for help
nnoremap <F1> <nop>
vnoremap <F1> <nop>
inoremap <F1> <nop>

" don't press K for manpage
nnoremap K <nop>
vnoremap K <nop>

" don't press M to position cursor on middle line of window
nnoremap M <nop>
vnoremap M <nop>

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
