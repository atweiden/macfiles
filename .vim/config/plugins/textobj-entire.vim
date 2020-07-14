" text objects for select all sans kana/vim-textobj-entire
for [s:k, s:m] in  [['aE', 'gg0VG$'], ['iE', 'gg^vGg_']]
  execute 'onoremap <silent> ' . s:k . ' :normal! ' . s:m . '<CR>'
  execute 'vnoremap <silent> ' . s:k . ' :normal! ' . s:m . '<CR>'
endfor

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
