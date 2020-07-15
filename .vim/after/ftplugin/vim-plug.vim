" Credit: https://github.com/junegunn/vim-plug/pull/255#issuecomment-119524529

function! s:scroll_preview(down)
  silent! wincmd P
  if &previewwindow
    execute 'normal!' a:down ? "\<C-E>" : "\<C-Y>"
    wincmd p
  endif
endfunction

function! s:setup_extra_keys()
  nnoremap <silent> <buffer> J :call <SID>scroll_preview(1)<CR>
  nnoremap <silent> <buffer> K :call <SID>scroll_preview(0)<CR>
  nnoremap <silent> <buffer> <C-N> :call search('^  \zs[0-9a-f]')<CR>
  nnoremap <silent> <buffer> <C-P> :call search('^  \zs[0-9a-f]', 'b')<CR>
  " we can even do this
  "nmap <silent> <buffer> <C-J> <C-N>o
  "nmap <silent> <buffer> <C-K> <C-P>o
endfunction

augroup vimplugkeys
  autocmd!
  autocmd FileType vim-plug call s:setup_extra_keys()
augroup END

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
