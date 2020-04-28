" don't return to last edit position
let b:noreturntopos = 1

set tabstop=2
set softtabstop=2
set shiftwidth=2

augroup gitdiffcommit
  autocmd!
  " show diff of current commit in preview window (ft-gitcommit-plugin)
  autocmd BufEnter <buffer>
    \ DiffGitCached | setlocal nofoldenable nowrap | wincmd p
  " close preview window when commit message buffer is unloaded
  autocmd BufUnload <buffer>
    \ pclose
augroup END

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
