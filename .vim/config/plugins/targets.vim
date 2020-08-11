" custom text-objects sans wellle/targets.vim
for s:char in [ '_', '.', ':', ',', ';', '<Bar>', '/', '<Bslash>', '*', '+', '%', '$' ]
  execute 'xnoremap i' . s:char . ' :<C-U>normal! T' . s:char . 'vt' . s:char . '<CR>'
  execute 'onoremap i' . s:char . ' :normal vi' . s:char . '<CR>'
  execute 'xnoremap a' . s:char . ' :<C-U>normal! F' . s:char . 'vf' . s:char . '<CR>'
  execute 'onoremap a' . s:char . ' :normal va' . s:char . '<CR>'
endfor

" whitespace under cursor as text object
onoremap <silent> a<space> :let r = @/ \| let @/ = "\\s*\\(\\%#\\&\\s\\)\\s*" \| :execute "normal! gn" \| let @/ = r<CR>
onoremap <silent> i<space> :let r = @/ \| let @/ = "\\s\\@<=\\s*\\(\\%#\\&\\s\\)\\s*" \| :execute "normal! gn" \| let @/ = r<CR>

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
