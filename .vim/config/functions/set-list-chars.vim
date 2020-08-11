function! SetListCharsTabVisible() abort
  let s:tabchar = has('gui_running') ? '⎸' : '┊'
  execute printf('set listchars=tab:%s\ ', s:tabchar)
endfunction

function! SetListCharsTabInvisible() abort
  execute printf('set listchars=tab:\ \ ')
endfunction

function! SetListCharsRemaining() abort
  set listchars+=nbsp:·
  set listchars+=extends:›
  set listchars+=precedes:‹
endfunction

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
