" Credit: http://vimcasts.org/episodes/tabs-and-spaces/

function! TabstopSummarize() abort
  try
    echohl ModeMsg
    echon 'tabstop=' . &l:ts
    echon ' shiftwidth=' . &l:sw
    echon ' softtabstop=' . &l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

" set tabstop, softtabstop and shiftwidth to the same value
function! TabstopSet() abort
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call TabstopSummarize()
endfunction

command! -nargs=* TabstopSet call TabstopSet()
command! TabstopSummarize call TabstopSummarize()

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
