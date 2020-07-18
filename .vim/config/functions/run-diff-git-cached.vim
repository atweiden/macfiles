" show diff of current commit in preview window (ft-gitcommit-plugin)
function! RunDiffGitCached()
  " only run `DiffGitCached` once
  if exists('t:diffgitcached')
    return
  endif
  silent! execute "DiffGitCached"
  let t:diffgitcached = 1
  setlocal nofoldenable
  setlocal nowrap
  " switch back to previous window
  wincmd p
endfunction

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
