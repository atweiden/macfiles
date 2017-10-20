function! TmuxSendKeys(cmd)
  execute 'silent !tmux send-keys -t 2 "' . a:cmd . '" C-m'
  execute 'redraw!'
endfunction

command! -nargs=* TmuxSendKeys call TmuxSendKeys(<q-args>)

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
