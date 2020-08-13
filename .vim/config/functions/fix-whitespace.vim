" Credit: https://github.com/bronson/vim-trailing-whitespace

" remove end of line white space without clobbering search history
function! FixWhitespace(line1, line2) abort
  let l:save_pos = getpos('.')
  silent! execute ':keeppatterns ' . a:line1 . ',' . a:line2 . 's/\s\+$//'
  call setpos('.', l:save_pos)
endfunction

command! -range=% FixWhitespace call FixWhitespace(<line1>, <line2>)

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
