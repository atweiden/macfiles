vim9script

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

def RunDiffGitCached(): void
  # only run `DiffGitCached` once
  if exists('t:diffgitcached')
    return
  endif
  silent! execute "DiffGitCached"
  t:diffgitcached = 1
  setlocal nofoldenable
  setlocal nowrap
  # switch back to previous window
  wincmd p
enddef

augroup gitdiffcommit
  autocmd!
  # show diff of current commit in preview window
  autocmd BufEnter <buffer> RunDiffGitCached()
  # close preview window when commit message buffer is unloaded
  autocmd BufUnload <buffer> pclose
augroup END

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
