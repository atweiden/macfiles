" works in unison with feedkeys and b:winsaveview
" see also: Dedent, DeleteCharRight, Indent
function! SilentRestoreView() abort
  call winrestview(b:winsaveview)
  echo ''
endfunction

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
