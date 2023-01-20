vim9script

export def DisableLeftPadding(): void
  # restore FoldColumn highlighting to original with :q
  highlight clear FoldColumn
  set foldcolumn=0
enddef

export def EnableLeftPadding(): void
  highlight clear FoldColumn
  highlight FoldColumn ctermfg=bg ctermbg=bg guifg=bg guibg=bg
  set foldcolumn=1
enddef

export def CycleFocusWin(): void
  var focuswinstate = get(g:, 'focuswinstate', 1)
  # 1. disable statusline, disable linenumbers (add left padding)
  # 2. enable statusline, disable linenumbers (add left padding)
  # 3. disable statusline, enable linenumbers (rm left padding)
  # 4. enable statusline, enable linenumbers (rm left padding)
  if focuswinstate == 1
    set laststatus=0
    set nonumber norelativenumber
    EnableLeftPadding()
    g:focuswinstate = 2
  elseif focuswinstate == 2
    set laststatus=2
    set nonumber norelativenumber
    EnableLeftPadding()
    g:focuswinstate = 3
  elseif focuswinstate == 3
    set laststatus=0
    set number relativenumber
    DisableLeftPadding()
    g:focuswinstate = 4
  elseif focuswinstate == 4
    set laststatus=2
    set number relativenumber
    DisableLeftPadding()
    g:focuswinstate = 1
  endif
enddef

export def ToggleLeftPadding(): void
  if &foldcolumn == 0
    EnableLeftPadding()
  else
    DisableLeftPadding()
  endif
enddef

export def ToggleLineNumbers(): void
  if &number == &relativenumber
    set nonumber! norelativenumber!
  else
    set nonumber norelativenumber
  endif
enddef

export def ToggleLineNumbersLeftPadded(): void
  ToggleLineNumbers()
  ToggleLeftPadding()
enddef

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
