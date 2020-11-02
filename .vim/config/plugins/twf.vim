function! s:TwfVim() abort
  let temp = tempname()
  execute 'silent ! twf ' . @% . ' > ' . temp
  redraw!
  try
    let out = filereadable(temp) ? readfile(temp) : []
  finally
    silent! call delete(temp)
  endtry
  if !empty(out)
    execute 'edit! ' . out[0]
  endif
endfunction

function! s:TwfNvimExit(path) abort
  function! TwfNvimExitClosure(job_id, data, event) abort closure
    bdelete!
    try
      let out = filereadable(a:path) ? readfile(a:path) : []
    finally
      silent! call delete(a:path)
    endtry
    if !empty(out)
      execute 'edit! ' . out[0]
    endif
  endfunction
  return funcref('TwfNvimExitClosure')
endfunction

function! s:TwfNvim() abort
  let temp = tempname()
  call termopen('twf ' . @% . ' > ' . temp, { 'on_exit': <SID>TwfNvimExit(temp) })
  startinsert
endfunction

function! Twf() abort
  if !has('nvim')
    call <SID>TwfVim()
  else
    call <SID>TwfNvim()
  endif
endfunction

command! Twf call Twf()

function! s:TwfChooser(dirname) abort
  if isdirectory(a:dirname)
    call Twf()
  endif
endfunction

augroup twf
  autocmd!
  autocmd BufEnter * silent call <SID>TwfChooser(expand("<amatch>"))
augroup END

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
