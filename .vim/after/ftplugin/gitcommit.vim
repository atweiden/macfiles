" don't return to last edit position
let b:noreturntopos = 1

" always start at top line when writing commit message
execute "normal gg"

" disable folding in inline diff
setlocal nofoldenable

" show diff of current commit in preview window, :help ft-gitcommit-plugin
DiffGitCached | set nowrap | wincmd p

" close preview window when commit message buffer is unloaded
autocmd BufUnload <buffer> pclose

set tabstop=2
set softtabstop=2
set shiftwidth=2

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
