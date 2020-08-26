" facilitate lazy loading
augroup loadcapture
  autocmd!
  autocmd User LoadCapture ++once packadd capture.vim
augroup END

command! -bang -nargs=+ -complete=command Capture :silent doautocmd User LoadCapture | Capture<bang> <args>

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
