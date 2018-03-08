" editing {{{

" --- selecting {{{

" bind escape key
call arpeggio#load()
Arpeggio noremap jk <ESC>
Arpeggio inoremap jk <ESC>
Arpeggio cnoremap jk <C-C>

" visually select the text that was last edited/pasted
nnoremap <expr> gV '`[' . strpart(getregtype(), 0, 1) . '`]'

" visually select the last inserted text
nnoremap g. :normal! `[v`]<CR><Left>

" preserve selection when indenting
vnoremap > >gv
vnoremap < <gv
nnoremap > >>
nnoremap < <<

" --- end selecting }}}
" --- toggle showcmd {{{

nnoremap <silent> <leader>sc :set showcmd!<CR>

" --- end toggle showcmd }}}
" --- toggle virtualedit=all {{{

nnoremap <silent> <leader><leader>v :let &virtualedit=&virtualedit=="block" ? "all" : "block" <Bar> set virtualedit?<CR>

" --- end toggle virtualedit=all }}}
" --- search and replace {{{

" remove search highlights
nnoremap <silent> <leader><CR> :nohlsearch<CR>

" --- end search and replace }}}
" --- pasting {{{

" yank to end of line
noremap Y y$

" copy to clipboard
vnoremap <leader>y "+yy<ESC>
nnoremap <leader>y "+y
nnoremap <leader>Y "+y$

" paste from clipboard
noremap <leader>p "+p
noremap <leader>P "+P

" toggle paste mode
set pastetoggle=<F2>

" --- end pasting }}}
" --- formatting {{{

" format visual selection with spacebar
vnoremap <space> :!fmt<CR>

" --- end formatting }}}
" --- proofreading {{{

" find two spaces after a period
nnoremap <leader><leader>. /\.\s\s\+\w/s+1<CR>

" --- end proofreading }}}
" --- writing {{{

" quick write
nnoremap <silent> <leader>w :w<CR>

" sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" expand %% to the path of the current buffer
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" change to directory of file
nnoremap <silent> <leader>. :cd%:h<CR>

" --- end writing }}}
" --- redoing {{{

" maintain location in document while redoing
nnoremap . .`[

" qq to record, Q to replay
nnoremap Q @q

" --- end redoing }}}
" --- words {{{

" digraphs
if has('digraphs')
  " (§) section sign
  digraph SS 167
  " (ʹ) modifier letter prime
  digraph '' 697
  " (฿) BTC
  digraph B\| 3647
  " (᚛) ogham feather mark
  digraph >\| 5787
  " (᚜) ogham reversed feather mark
  digraph <\| 5788
  " (–) en dash
  digraph -- 8211
  " (—) em dash
  digraph -= 8212
  " (‘) curly left single quote
  digraph Ql 8216
  " (’) curly right single quote
  digraph Qr 8217
  " (“) curly left double quote
  digraph ql 8220
  " (”) curly right double quote
  digraph qr 8221
  " (…) ellipsis
  digraph ., 8230
  " (⁅) left square bracket with quill
  digraph [- 8261
  " (⁆) right square bracket with quill
  digraph -] 8262
  " (∈) equivalent to `(elem)`: https://doc.perl6.org/routine/%E2%88%88
  digraph (- 8712
  " (∉) equivalent to `!(elem)`: https://doc.perl6.org/routine/%E2%88%89
  digraph (/ 8713
  " (∋) equivalent to `(cont)`: https://doc.perl6.org/routine/%E2%88%8B
  digraph -) 8715
  " (∌) equivalent to `!(cont)`: https://doc.perl6.org/routine/%E2%88%8C
  digraph /) 8716
  " (∖) equivalent to `(-)`: https://doc.perl6.org/routine/%E2%88%96
  digraph \\ 8726
  " (∩) equivalent to `(&)`: https://doc.perl6.org/routine/%E2%88%A9
  digraph (U 8745
  " (∪) equivalent to `(|)`: https://doc.perl6.org/routine/%E2%88%AA
  digraph )U 8746
  " (≅) equivalent to `=~=`
  digraph =~ 8773
  " (≼) equivalent to `(<+)`: https://doc.perl6.org/routine/%E2%89%BC
  digraph <+ 8828
  " (≽) equivalent to `(+>)`: https://doc.perl6.org/routine/%E2%89%BD
  digraph +> 8829
  " (⊂) equivalent to `(<)`: https://doc.perl6.org/routine/%E2%8A%82
  digraph (c 8834
  " (⊃) equivalent to `(>)`: https://doc.perl6.org/routine/%E2%8A%83
  digraph )c 8835
  " (⊄) equivalent to `!(<)`: https://doc.perl6.org/routine/%E2%8A%84
  digraph c/ 8836
  " (⊅) equivalent to `!(>)`: https://doc.perl6.org/routine/%E2%8A%85
  digraph \c 8837
  " (⊆) equivalent to `(<=)`: https://doc.perl6.org/routine/%E2%8A%86
  digraph (_ 8838
  " (⊇) equivalent to `(>=)`: https://doc.perl6.org/routine/%E2%8A%87
  digraph )_ 8839
  " (⊈) equivalent to `!(<=)`: https://doc.perl6.org/routine/%E2%8A%88
  digraph _/ 8840
  " (⊉) equivalent to `!(>=)`: https://doc.perl6.org/routine/%E2%8A%89
  digraph \_ 8841
  " (⊍) equivalent to `(.)`: https://doc.perl6.org/routine/%E2%8A%8D
  digraph U. 8845
  " (⊎) equivalent to `(+)`: https://doc.perl6.org/routine/%E2%8A%8E
  digraph U+ 8846
  " (⊖) equivalent to `(^)`: https://doc.perl6.org/routine/%E2%8A%96
  digraph 0- 8854
  " (✓) checkmark
  digraph ./ 10003
  " (⟅) left s-shaped bag delimiter
  digraph s\ 10181
  " (⟆) right s-shaped bag delimiter
  digraph s/ 10182
endif

" --- end words }}}
" --- timestamp {{{

" insert timestamp
nnoremap <silent> <leader>d :put=strftime('%FT%T%z')<CR>

" --- end timestamp }}}

" end editing }}}

" lines {{{

" --- toggles {{{

" toggle line wrap
noremap <silent> <F3> :set nowrap!<CR>
inoremap <silent> <F3> <C-O>:set nowrap!<CR>
vnoremap <silent> <F3> <ESC>:set nowrap!<CR>gv

" toggle line numbers
nnoremap <silent> <F4> :set norelativenumber!<CR>
inoremap <silent> <F4> <C-O>:set norelativenumber!<CR>
vnoremap <silent> <F4> <ESC>:set norelativenumber!<CR>gv

" toggle line and column highlighting
noremap <silent> <F5> :set nocursorline! nocursorcolumn!<CR>
inoremap <silent> <F5> <C-O>:set nocursorline! nocursorcolumn!<CR>
vnoremap <silent> <F5> <ESC>:set nocursorline! nocursorcolumn!<CR>gv

" toggle spell checking
noremap <silent> <F7> :set spell! spelllang=en_us<CR>
inoremap <silent> <F7> <C-O>:set spell! spelllang=en_us<CR>
vnoremap <silent> <F7> <ESC>:set spell! spelllang=en_us<CR>gv

" convert all tabs into spaces and continue session with spaces
nnoremap <silent><expr> g<M-t> ':set expandtab<CR>:retab!<CR>:echo "Tabs have been converted to spaces"<CR>'

" convert all spaces into tabs and continue session with tabs
nnoremap <silent><expr> g<M-T> ':set noexpandtab<CR>:%retab!<CR>:echo "Spaces have been converted to tabs"<CR>'

" --- end toggles }}}
" --- split/joins {{{

" keep the cursor in place while joining lines
nnoremap J mzJ`z

" split line
nnoremap <silent> S i<CR><ESC>^mwgk:silent! s/\v +$//<CR>:noh<CR>`w

" --- end split/joins }}}
" --- deletes {{{

" delete char adjacent-right without moving cursor over one from the left
nnoremap <silent> gx @='lxh'<CR>

" --- end deletes }}}
" --- movement {{{

" move between beginning and end of line
nnoremap H ^
vnoremap H ^
nnoremap L g_
vnoremap L g_

" move to middle of current line
nnoremap <expr> - (strlen(getline("."))/2)."<Bar>"

" move to last change
nnoremap gI `.

" <PageUp> and <PageDown> do silly things in normal mode with folds
noremap <PageUp> <C-U>
noremap <PageDown> <C-D>

" --- end movement }}}

" end lines }}}

" programming {{{

" --- tabs {{{

" set tabstop, shiftwidth and softtabstop to same (specified) value
nnoremap <leader>ts :Stab<CR>

" echo tabstop, shiftwidth, softtabstop and expandtab values
nnoremap <leader>st :call SummarizeTabs()<CR>

" --- end tabs }}}
" --- folds {{{

" toggle folds with g+spacebar
nnoremap <silent> g<space> :exe ":silent! normal za"<CR>

" focus just the current line with minimal number of folds open
nnoremap <silent> <leader><leader><space> :call FocusLine()<CR>

" make zO recursively open whatever fold we're in, even if it's partially open
nnoremap zO zczO

" set fold level
nnoremap <leader>f0 :set foldlevel=0<CR>
nnoremap <leader>f1 :set foldlevel=1<CR>
nnoremap <leader>f2 :set foldlevel=2<CR>
nnoremap <leader>f3 :set foldlevel=3<CR>
nnoremap <leader>f4 :set foldlevel=4<CR>
nnoremap <leader>f5 :set foldlevel=5<CR>
nnoremap <leader>f6 :set foldlevel=6<CR>
nnoremap <leader>f7 :set foldlevel=7<CR>
nnoremap <leader>f8 :set foldlevel=8<CR>
nnoremap <leader>f9 :set foldlevel=9<CR>

" --- end folds }}}
" --- merging {{{

" jump to next conflict marker
nnoremap <silent> <leader>jc /^\(<\\|=\\|>\)\{7\}\([^=].\+\)\?$<CR>

" --- end merging }}}
" --- hex {{{

" toggle between hex and binary, after opening file with `vim -b`
noremap <silent> <F9> :call HexMe()<CR>
inoremap <silent> <F9> <C-O>:call HexMe()<CR>
vnoremap <silent> <F9> <ESC>:call HexMe()<CR>gv

" --- end hex }}}

" end programming }}}

" navigation {{{

" --- buffers {{{

" buffer navigation
nnoremap <silent> gd :bdelete<CR>
nnoremap <silent> gb :bnext<CR>
nnoremap <silent> gB :bprev<CR>
nnoremap <silent> <leader>1 :<C-U>buffer 1<CR>
nnoremap <silent> <leader>2 :<C-U>buffer 2<CR>
nnoremap <silent> <leader>3 :<C-U>buffer 3<CR>
nnoremap <silent> <leader>4 :<C-U>buffer 4<CR>
nnoremap <silent> <leader>5 :<C-U>buffer 5<CR>
nnoremap <silent> <leader>6 :<C-U>buffer 6<CR>
nnoremap <silent> <leader>7 :<C-U>buffer 7<CR>
nnoremap <silent> <leader>8 :<C-U>buffer 8<CR>
nnoremap <silent> <leader>9 :<C-U>buffer 9<CR>

" --- end buffers }}}
" --- windows {{{

" map alt-[h,j,k,l,=,_,|] to resizing a window split
" map alt-[s,v] to horizontal and vertical split respectively
" map alt-[N,P] to moving to next and previous window respectively
" map alt-[H,J,K,L] to repositioning a window split
nnoremap <silent> <M-h> :<C-U>ObviousResizeLeft<CR>
nnoremap <silent> <M-j> :<C-U>ObviousResizeDown<CR>
nnoremap <silent> <M-k> :<C-U>ObviousResizeUp<CR>
nnoremap <silent> <M-l> :<C-U>ObviousResizeRight<CR>
nnoremap <silent> <M-=> <C-W>=
nnoremap <silent> <M-_> <C-W>_
nnoremap <silent> <M-\|> <C-W>\|
nnoremap <silent> <M-s> :split<CR>
nnoremap <silent> <M-v> :vsplit<CR>
nnoremap <silent> <M-N> <C-W><C-W>
nnoremap <silent> <M-P> <C-W><S-W>
nnoremap <silent> <M-H> <C-W>H
nnoremap <silent> <M-J> <C-W>J
nnoremap <silent> <M-K> <C-W>K
nnoremap <silent> <M-L> <C-W>L

" create a split on the given side
nnoremap <leader>swh :leftabove vsp<CR>
nnoremap <leader>swl :rightbelow vsp<CR>
nnoremap <leader>swk :leftabove sp<CR>
nnoremap <leader>swj :rightbelow sp<CR>

" scroll all windows simultaneously
nnoremap <silent> <S-F5> :windo set scrollbind!<CR>
inoremap <silent> <S-F5> <C-O>:windo set scrollbind!<CR>

" --- end windows }}}
" --- tabs {{{

" new tab
nnoremap <silent> <M-Down> :tabnew<CR>

" close tab
nnoremap <silent> <M-d> :tabclose<CR>

" switch between tabs
nnoremap <silent> ( @='gT'<CR>
nnoremap <silent> ) @='gt'<CR>

" move tab adjacent
nnoremap <silent> g( :<C-U>:execute "tabmove -" . v:count1<CR>
nnoremap <silent> g) :<C-U>:execute "tabmove +" . v:count1<CR>

" move tab
noremap <leader>tm :tabmove<space>

" open specified file in new tab
noremap <leader>te :tabedit <C-R>=expand("%:p:h")<CR>/

" allows typing :tabv myfile.txt to view the specified file in a new read-only tab
cabbrev tabv tab sview +setlocal\ nomodifiable

" press Shift-F12 to show all buffers in tabs, or to close all tabs
let notabs = 0
nnoremap <silent> <S-F12> :let notabs=!notabs<Bar>:if notabs<Bar>:tabo<Bar>:else<Bar>:tab ball<Bar>:tabn<Bar>:endif<CR>

" show and hide tabline
nnoremap <silent> <M-S-Up> :set showtabline=0<CR>
nnoremap <silent> <M-S-Down> :set showtabline=1<CR>

" --- end tabs }}}

" end navigation }}}

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
