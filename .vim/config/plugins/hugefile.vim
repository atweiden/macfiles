" activate when loading files >= 2 MiB in size
let g:hugefile_trigger_size = 2

" toggle with F10
nnoremap <silent> <F10> :HugefileToggle<CR>
inoremap <silent> <F10> <C-O>:HugefileToggle<CR>
vnoremap <silent> <F10> <ESC>:HugefileToggle<CR>gv

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
