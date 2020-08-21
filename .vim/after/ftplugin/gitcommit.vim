setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

" don't return to last edit position
let b:noreturntopos = 1

function! s:RunDiffGitCached() abort
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

augroup gitdiffcommit
  autocmd!
  " show diff of current commit in preview window
  autocmd BufEnter <buffer> call <SID>RunDiffGitCached()
  " close preview window when commit message buffer is unloaded
  autocmd BufUnload <buffer> pclose
augroup END

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
