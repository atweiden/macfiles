" don't return to last edit position
let b:noreturntopos = 1

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

augroup gitdiffcommit
  autocmd!
  " show diff of current commit in preview window
  autocmd BufEnter <buffer>
    \ call RunDiffGitCached()
  " close preview window when commit message buffer is unloaded
  autocmd BufUnload <buffer>
    \ pclose
augroup END

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
