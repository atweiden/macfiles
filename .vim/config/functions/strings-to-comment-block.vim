" Credit: https://github.com/johannesthyssen/vim-signit

" convert array of strings to comment block with N number of whitespaces
" prepended to each line
function! StringsToCommentBlock(strings, n) abort
  return join(map(copy(a:strings), {_, v ->
              \ printf(&commentstring, repeat(' ', a:n) .. v)}), "\n")
endfunction

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
