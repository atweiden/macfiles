function! Repeatable(function) abort
  let &operatorfunc = a:function
  return 'g@l'
endfunction

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
