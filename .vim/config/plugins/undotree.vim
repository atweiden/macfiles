" facilitate lazy loading
augroup loadundotree
  autocmd!
  autocmd User LoadUndotree ++once packadd undotree
augroup END

command! UndotreeToggle :silent doautocmd User LoadUndotree | UndotreeToggle

nnoremap <silent> <F8> :UndotreeToggle<CR>
inoremap <silent> <F8> <C-O>:UndotreeToggle<CR>
vnoremap <silent> <F8> <ESC>:UndotreeToggle<CR>gv

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
