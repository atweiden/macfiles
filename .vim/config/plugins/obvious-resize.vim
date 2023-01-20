vim9script

# resize windows 1 line at a time
g:obvious_resize_default = 1

# use alt-{h,j,k,l} to resize windows
nnoremap <silent> <M-h> :<C-U>ObviousResizeLeft<CR>
inoremap <silent> <M-h> <C-O>:<C-U>ObviousResizeLeft<CR>
vnoremap <silent> <M-h> <ESC>:<C-U>ObviousResizeLeft<CR>gv
cnoremap <silent> <M-h> <C-C>:<C-U>ObviousResizeLeft<CR>
tnoremap <silent> <M-h> <C-W>:<C-U>ObviousResizeLeft<CR>
nnoremap <silent> <M-j> :<C-U>ObviousResizeDown<CR>
inoremap <silent> <M-j> <C-O>:<C-U>ObviousResizeDown<CR>
vnoremap <silent> <M-j> <ESC>:<C-U>ObviousResizeDown<CR>gv
cnoremap <silent> <M-j> <C-C>:<C-U>ObviousResizeDown<CR>
tnoremap <silent> <M-j> <C-W>:<C-U>ObviousResizeDown<CR>
nnoremap <silent> <M-k> :<C-U>ObviousResizeUp<CR>
inoremap <silent> <M-k> <C-O>:<C-U>ObviousResizeUp<CR>
vnoremap <silent> <M-k> <ESC>:<C-U>ObviousResizeUp<CR>gv
cnoremap <silent> <M-k> <C-C>:<C-U>ObviousResizeUp<CR>
tnoremap <silent> <M-k> <C-W>:<C-U>ObviousResizeUp<CR>
nnoremap <silent> <M-l> :<C-U>ObviousResizeRight<CR>
inoremap <silent> <M-l> <C-O>:<C-U>ObviousResizeRight<CR>
vnoremap <silent> <M-l> <ESC>:<C-U>ObviousResizeRight<CR>gv
cnoremap <silent> <M-l> <C-C>:<C-U>ObviousResizeRight<CR>
tnoremap <silent> <M-l> <C-W>:<C-U>ObviousResizeRight<CR>

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
