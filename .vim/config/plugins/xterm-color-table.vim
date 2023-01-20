vim9script

# facilitate lazy loading
augroup loadxtermcolortable
  autocmd!
  autocmd User LoadXtermColorTable ++once packadd xterm-color-table.vim
augroup END

command! XtermColorTable :silent doautocmd User LoadXtermColorTable | XtermColorTable
command! SXtermColorTable :silent doautocmd User LoadXtermColorTable | SXtermColorTable
command! VXtermColorTable :silent doautocmd User LoadXtermColorTable | VXtermColorTable
command! TXtermColorTable :silent doautocmd User LoadXtermColorTable | TXtermColorTable
command! EXtermColorTable :silent doautocmd User LoadXtermColorTable | EXtermColorTable
command! OXtermColorTable :silent doautocmd User LoadXtermColorTable | OXtermColorTable

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
