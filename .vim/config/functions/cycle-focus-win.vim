function! CycleFocusWin() abort
  let s:focuswinstate = get(g:, 'focuswinstate', 1)
  " 1. disable statusline, disable linenumbers (add left padding)
  " 2. enable statusline, disable linenumbers (add left padding)
  " 3. disable statusline, enable linenumbers (rm left padding)
  " 4. enable statusline, enable linenumbers (rm left padding)
  if s:focuswinstate == 1
    set laststatus=0
    set nonumber norelativenumber
    call EnableLeftPadding()
    let g:focuswinstate = 2
  elseif s:focuswinstate == 2
    set laststatus=2
    set nonumber norelativenumber
    call EnableLeftPadding()
    let g:focuswinstate = 3
  elseif s:focuswinstate == 3
    set laststatus=0
    set number relativenumber
    call DisableLeftPadding()
    let g:focuswinstate = 4
  elseif s:focuswinstate == 4
    set laststatus=2
    set number relativenumber
    call DisableLeftPadding()
    let g:focuswinstate = 1
  endif
endfunction

command! CycleFocusWin call CycleFocusWin()

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
