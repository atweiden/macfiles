function! ReturnToLastEditPosition() abort
  " only return to last edit position if b:noreturntopos variable is unset
  if exists('b:noreturntopos')
    return
  endif
  if line("'\"") > 1 && line("'\"") <= line("$")
    execute "normal! g`\""
  endif
endfunction

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
