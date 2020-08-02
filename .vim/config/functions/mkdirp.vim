" Credit: https://github.com/duggiefresh/vim-easydir
"         https://github.com/h-michael/dotfiles

function! MkdirP(dir, force) abort
  let l:input = '"%s" does not exist. Create? [y/N]'
  if a:dir !~# '^\w\+:'
    \ && !isdirectory(a:dir)
    \ && &l:buftype ==# ''
    \ && (a:force || input(printf(l:input, a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
