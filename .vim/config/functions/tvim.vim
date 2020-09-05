" see also: .functions.d/tvim.sh, .vim/config/terminal.vim
function! TvimOpen(bufnr, arglist) abort
  " convert layout
  if a:arglist[0] == 'sp'
    let l:layout = ''
  elseif a:arglist[0] == 'vs'
    let l:layout = 'vertical'
  elseif a:arglist[0] == 'tab'
    let l:layout = 'tab'
  endif

  let l:file = a:arglist[1]

  " open file
  wincmd W
  if l:file == ''
    execute l:layout 'new'
  else
    execute l:layout 'split' l:file
  endif
endfunction

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
