vim9script

# custom text-objects sans wellle/targets.vim
for char in [ '_', '.', ':', ',', ';', '<Bar>', '/', '<Bslash>', '*', '+', '%', '$' ]
  execute 'xnoremap <silent> i' .. char .. ' :<C-U>normal! T' .. char .. 'vt' .. char .. '<CR>'
  execute 'onoremap <silent> i' .. char .. ' :normal vi' .. char .. '<CR>'
  execute 'xnoremap <silent> a' .. char .. ' :<C-U>normal! F' .. char .. 'vf' .. char .. '<CR>'
  execute 'onoremap <silent> a' .. char .. ' :normal va' .. char .. '<CR>'
endfor

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
