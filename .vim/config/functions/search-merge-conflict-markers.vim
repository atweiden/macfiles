function! SearchMergeConflictMarkersBackward(ignore) abort
  let l:count = v:count1
  while l:count
    call search('\v^[<=>]{7}([^=].+)?$', "bsz")
    let l:count -= 1
  endwhile
endfunction

function! SearchMergeConflictMarkersForward(ignore) abort
  let l:count = v:count1
  while l:count
    call search('\v^[<=>]{7}([^=].+)?$', "sz")
    let l:count -= 1
  endwhile
endfunction

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
