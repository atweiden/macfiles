" Credit: https://github.com/junegunn/dotfiles/blob/master/vimrc

" ----------------------------------------------------------------------------
" <leader>t | vim-tbone
" ----------------------------------------------------------------------------

function! s:tmux_send(dest) range
  call inputsave()
  let dest = empty(a:dest) ? input('To which pane? ') : a:dest
  call inputrestore()
  silent call tbone#write_command(0, a:firstline, a:lastline, 1, dest)
endfunction

for m in ['n', 'x']
  let gv = m == 'x' ? 'gv' : ''
  execute m . "noremap <silent> <leader>tt :call <SID>tmux_send('')<CR>" . gv
  execute m . "noremap <silent> <leader>th :call <SID>tmux_send('.left')<CR>" . gv
  execute m . "noremap <silent> <leader>tj :call <SID>tmux_send('.bottom')<CR>" . gv
  execute m . "noremap <silent> <leader>tk :call <SID>tmux_send('.top')<CR>" . gv
  execute m . "noremap <silent> <leader>tl :call <SID>tmux_send('.right')<CR>" . gv
  execute m . "noremap <silent> <leader>ty :call <SID>tmux_send('.top-left')<CR>" . gv
  execute m . "noremap <silent> <leader>to :call <SID>tmux_send('.top-right')<CR>" . gv
  execute m . "noremap <silent> <leader>tn :call <SID>tmux_send('.bottom-left')<CR>" . gv
  execute m . "noremap <silent> <leader>t. :call <SID>tmux_send('.bottom-right')<CR>" . gv
endfor

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
