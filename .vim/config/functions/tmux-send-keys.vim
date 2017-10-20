function! TmuxSendKeys(cmd)
  execute "! tmux send-keys -t 2 \"" . a:cmd . "\" C-m"
endfunction

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
