" Credit: https://gist.github.com/ddresselhaus/98b022e295bc27e9264dece7823e74e8

function! TestCmd(path, lineno) abort
  let cmd = join(["mix test --only", " line:", a:lineno, " ", a:path], "")
  return cmd
endfunction

nnoremap <leader>el :call TmuxSendKeys(TestCmd(expand("%:p"), line(".")))<CR>

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
