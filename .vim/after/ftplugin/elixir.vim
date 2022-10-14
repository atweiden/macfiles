function! s:LoadTboneCompletePanes(...) abort
  silent doautocmd User LoadTbone
  return tbone#complete_panes(a:000)
endfunction

" test only selected lines with mix (see: `mix help test`)
function! s:MixTestOnly(...) range abort
  " check file is on disk
  let l:path = expand('%:p')
  if empty(l:path)
    return
  endif

  " lazy load tpope/vim-tbone
  silent doautocmd User LoadTbone

  " get destination pane
  let l:dest = get(a:, 1, '')
  if empty(l:dest)
    call inputsave()
    let l:dest = input('To which pane? ')
    call inputrestore()
  endif

  " send to destination pane
  let l:mix_cmd = printf('mix test %s:%d:%d', l:path, a:firstline, a:lastline)
  try
    call tbone#send_keys(l:dest, l:mix_cmd . "\r")
  catch /.*/
    return 'echoerr ' . string(v:exception)
  endtry
endfunction

command! -nargs=? -range -complete=custom,<SID>LoadTboneCompletePanes MixTestOnly <line1>,<line2>call <SID>MixTestOnly(<f-args>)

for m in ['n', 'x']
  let gv = m == 'x' ? 'gv' : ''
  execute m . "noremap <silent> <buffer> <localleader>tt :call <SID>MixTestOnly('')<CR>" . gv
  execute m . "noremap <silent> <buffer> <localleader>th :call <SID>MixTestOnly('.left')<CR>" . gv
  execute m . "noremap <silent> <buffer> <localleader>tj :call <SID>MixTestOnly('.bottom')<CR>" . gv
  execute m . "noremap <silent> <buffer> <localleader>tk :call <SID>MixTestOnly('.top')<CR>" . gv
  execute m . "noremap <silent> <buffer> <localleader>tl :call <SID>MixTestOnly('.right')<CR>" . gv
  execute m . "noremap <silent> <buffer> <localleader>ty :call <SID>MixTestOnly('.top-left')<CR>" . gv
  execute m . "noremap <silent> <buffer> <localleader>to :call <SID>MixTestOnly('.top-right')<CR>" . gv
  execute m . "noremap <silent> <buffer> <localleader>tn :call <SID>MixTestOnly('.bottom-left')<CR>" . gv
  execute m . "noremap <silent> <buffer> <localleader>t. :call <SID>MixTestOnly('.bottom-right')<CR>" . gv
endfor

highlight clear elixirDocTest
highlight link elixirDocTest Comment

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
