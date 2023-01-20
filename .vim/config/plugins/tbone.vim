vim9script

# facilitate lazy loading
augroup loadtbone
  autocmd!
  autocmd User LoadTbone ++once packadd vim-tbone
augroup END

def LoadTboneCompletePanes(_): string
  silent doautocmd User LoadTbone
  return tbone#complete_panes()
enddef

function TmuxSend(...) range abort
  let l:dest = get(a:, 1, '')
  call <SID>DoTmuxSend(l:dest, a:firstline, a:lastline)
endfunction

def DoTmuxSend(dest_pane: string, first_line: number, last_line: number): void
  silent doautocmd User LoadTbone
  var dest = dest_pane
  if empty(dest)
    inputsave()
    dest = input('To which pane? ')
    inputrestore()
  endif
  silent tbone#write_command(0, first_line, last_line, 1, dest)
enddef

command! -nargs=? -range -complete=custom,<SID>LoadTboneCompletePanes TmuxSend <line1>,<line2>call <SID>TmuxSend(<f-args>)

for m in ['n', 'x']
  var gv = m == 'x' ? 'gv' : ''
  execute m .. "noremap <silent> <leader>tt :call <SID>TmuxSend('')<CR>" .. gv
  execute m .. "noremap <silent> <leader>th :call <SID>TmuxSend('.left')<CR>" .. gv
  execute m .. "noremap <silent> <leader>tj :call <SID>TmuxSend('.bottom')<CR>" .. gv
  execute m .. "noremap <silent> <leader>tk :call <SID>TmuxSend('.top')<CR>" .. gv
  execute m .. "noremap <silent> <leader>tl :call <SID>TmuxSend('.right')<CR>" .. gv
  execute m .. "noremap <silent> <leader>ty :call <SID>TmuxSend('.top-left')<CR>" .. gv
  execute m .. "noremap <silent> <leader>to :call <SID>TmuxSend('.top-right')<CR>" .. gv
  execute m .. "noremap <silent> <leader>tn :call <SID>TmuxSend('.bottom-left')<CR>" .. gv
  execute m .. "noremap <silent> <leader>t. :call <SID>TmuxSend('.bottom-right')<CR>" .. gv
endfor

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
