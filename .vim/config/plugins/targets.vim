" custom text-objects sans wellle/targets.vim
for s:char in [ '_', '.', ':', ',', ';', '<Bar>', '/', '<Bslash>', '*', '+', '%', '$' ]
  execute 'xnoremap <silent> i' . s:char . ' :<C-U>normal! T' . s:char . 'vt' . s:char . '<CR>'
  execute 'onoremap <silent> i' . s:char . ' :normal vi' . s:char . '<CR>'
  execute 'xnoremap <silent> a' . s:char . ' :<C-U>normal! F' . s:char . 'vf' . s:char . '<CR>'
  execute 'onoremap <silent> a' . s:char . ' :normal va' . s:char . '<CR>'
endfor

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
