vim9script

# Credit: https://github.com/duggiefresh/vim-easydir
#         https://github.com/h-michael/dotfiles
export def MkdirP(dir: string, force: bool): void
  var input = '"%s" does not exist. Create? [y/N] '
  if dir !~# '^\w\+:' && !isdirectory(dir)
                    \ && &l:buftype ==# ''
                    \ && (force || input(printf(input, dir)) =~? '^y\%[es]$')
    mkdir(iconv(dir, &encoding, &termencoding), 'p')
  endif
enddef

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
