vim9script

def LoadTboneCompletePanes(_): string
  silent doautocmd User LoadTbone
  return tbone#complete_panes()
enddef

# test only selected lines with mix (see: `mix help test`)
function MixTestOnly(...) range abort
  let l:dest = get(a:, 1, '')
  call <SID>DoMixTestOnly(l:dest, a:firstline, a:lastline)
endfunction

def DoMixTestOnly(dest_pane: string, first_line: number, last_line: number): void
  # check file is on disk
  var path = expand('%:p')
  if empty(path)
    return
  endif

  # lazy load tpope/vim-tbone
  silent doautocmd User LoadTbone

  # get destination pane
  var dest = dest_pane
  if empty(dest)
    inputsave()
    dest = input('To which pane? ')
    inputrestore()
  endif

  # send to destination pane
  var mix_cmd = printf('mix test %s:%d:%d', path, first_line, last_line)
  try
    tbone#send_keys(dest, mix_cmd .. "\r")
  catch /.*/
    execute 'echoerr ' .. string(v:exception)
  endtry
enddef

command! -nargs=? -range -complete=custom,<SID>LoadTboneCompletePanes MixTestOnly :<line1>,<line2>call <SID>MixTestOnly(<f-args>)

for m in ['n', 'x']
  var gv = m == 'x' ? 'gv' : ''
  execute m .. "noremap <silent> <buffer> <localleader>tt :call <SID>MixTestOnly('')<CR>" .. gv
  execute m .. "noremap <silent> <buffer> <localleader>th :call <SID>MixTestOnly('.left')<CR>" .. gv
  execute m .. "noremap <silent> <buffer> <localleader>tj :call <SID>MixTestOnly('.bottom')<CR>" .. gv
  execute m .. "noremap <silent> <buffer> <localleader>tk :call <SID>MixTestOnly('.top')<CR>" .. gv
  execute m .. "noremap <silent> <buffer> <localleader>tl :call <SID>MixTestOnly('.right')<CR>" .. gv
  execute m .. "noremap <silent> <buffer> <localleader>ty :call <SID>MixTestOnly('.top-left')<CR>" .. gv
  execute m .. "noremap <silent> <buffer> <localleader>to :call <SID>MixTestOnly('.top-right')<CR>" .. gv
  execute m .. "noremap <silent> <buffer> <localleader>tn :call <SID>MixTestOnly('.bottom-left')<CR>" .. gv
  execute m .. "noremap <silent> <buffer> <localleader>t. :call <SID>MixTestOnly('.bottom-right')<CR>" .. gv
endfor

def HighlightElixir(): void
  highlight clear elixirDocTest
  highlight link elixirDocTest Comment
enddef

augroup highlightelixir
  autocmd!
  autocmd ColorScheme * HighlightElixir()
augroup END

HighlightElixir()

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
