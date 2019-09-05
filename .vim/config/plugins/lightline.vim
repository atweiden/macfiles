let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ 'mode_map': {
    \   'c': 'NORMAL'
    \ },
    \ 'active': {
    \   'left': [
    \     [ 'mode', 'paste' ],
    \     [ 'fugitive', 'filename' ]
    \   ],
    \   'right': [
    \     [ 'lineinfo' ],
    \     [ 'percent' ],
    \     [ 'fileformat', 'fileencoding', 'filetype' ]
    \   ]
    \ },
    \ 'component_function': {
    \   'fugitive': 'LightlineFugitive',
    \   'filename': 'LightlineFileName',
    \   'fileformat': 'LightlineFileFormat',
    \   'filetype': 'LightlineFileType',
    \   'fileencoding': 'LightlineFileEncoding',
    \   'mode': 'LightlineMode'
    \ },
    \ 'separator': {
    \   'left': '',
    \   'right': ''
    \ },
    \ 'subseparator': {
    \   'left': '',
    \   'right': ''
    \ }
  \ }

let g:lightline.tab = {
    \ 'active': [
    \   'tabnum',
    \   'lightlinetabname',
    \   'lightlinetabmodified'
    \ ],
    \ 'inactive': [
    \   'tabnum',
    \   'lightlinetabname',
    \   'lightlinetabmodified'
    \ ]
  \ }

let g:lightline.tab_component_function = {
    \ 'lightlinetabname': 'LightlineTabName',
    \ 'lightlinetabmodified': 'LightlineTabModified',
    \ 'readonly': 'lightline#tab#readonly',
    \ 'tabnum': 'lightline#tab#tabnum'
  \ }

function! LightlineModified()
  try
    if &modified == 1
      return '+'
    else
      return ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightlineReadOnly()
  try
    if &readonly
      return ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightlineFileName()
  return
    \ ('' != LightlineReadOnly() ? LightlineReadOnly() . ' ' : '') .
    \ (&ft == 'undotree' ? '' :
    \  &ft == 'vim-plug' ? '' :
    \  '' != expand('%:t') ? expand('%:t') : '[No Name]') .
    \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  try
    if exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? ' ' . _ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightlineFileFormat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFileType()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileEncoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return
    \ fname =~ 'NERD_tree' ? 'NERDTree' :
    \ &ft == 'undotree' ? 'UndoTree' :
    \ &ft == 'vim-plug' ? 'Plug' :
    \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightlineTabName(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let _ = expand('#' . buflist[winnr - 1] . ':t')
  return strlen(_) ? _ : '[No Name]'
endfunction

function! LightlineTabModified(n) abort
  let winnr = tabpagewinnr(a:n)
  return
    \ gettabwinvar(a:n, winnr, '&modified') ? '+' :
    \ gettabwinvar(a:n, winnr, '&modifiable') ? '' : '-'
endfunction

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
