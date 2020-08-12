" Credit: https://github.com/junegunn/dotfiles/blob/master/vimrc

" ----------------------------------------------------------------------------
" <leader>t | vim-tbone
" ----------------------------------------------------------------------------

function! s:TmuxSend(dest) range abort
  call inputsave()
  let dest = empty(a:dest) ? input('To which pane? ') : a:dest
  call inputrestore()
  silent call tbone#write_command(0, a:firstline, a:lastline, 1, dest)
endfunction

for m in ['n', 'x']
  let gv = m == 'x' ? 'gv' : ''
  execute m . "noremap <silent> <leader>tt :call <SID>TmuxSend('')<CR>" . gv
  execute m . "noremap <silent> <leader>th :call <SID>TmuxSend('.left')<CR>" . gv
  execute m . "noremap <silent> <leader>tj :call <SID>TmuxSend('.bottom')<CR>" . gv
  execute m . "noremap <silent> <leader>tk :call <SID>TmuxSend('.top')<CR>" . gv
  execute m . "noremap <silent> <leader>tl :call <SID>TmuxSend('.right')<CR>" . gv
  execute m . "noremap <silent> <leader>ty :call <SID>TmuxSend('.top-left')<CR>" . gv
  execute m . "noremap <silent> <leader>to :call <SID>TmuxSend('.top-right')<CR>" . gv
  execute m . "noremap <silent> <leader>tn :call <SID>TmuxSend('.bottom-left')<CR>" . gv
  execute m . "noremap <silent> <leader>t. :call <SID>TmuxSend('.bottom-right')<CR>" . gv
endfor

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
