vim9script

# text objects for select all sans kana/vim-textobj-entire
for [key, mapping] in  [['aE', 'gg0VG$'], ['iE', 'gg^vGg_']]
  execute 'onoremap <silent> ' .. key .. ' :normal! ' .. mapping .. '<CR>'
  execute 'vnoremap <silent> ' .. key .. ' :normal! ' .. mapping .. '<CR>'
endfor

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
