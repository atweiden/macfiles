vim9script

# facilitate lazy loading
augroup loadquickhl
  autocmd!
  autocmd User LoadQuickhl ++once packadd vim-quickhl
augroup END

nmap gm :silent doautocmd User LoadQuickhl<CR><Plug>(quickhl-manual-this)
xmap gm <ESC>:silent doautocmd User LoadQuickhl<CR>gv<Plug>(quickhl-manual-this)
nmap gM :silent doautocmd User LoadQuickhl<CR><Plug>(quickhl-manual-reset)
xmap gM <ESC>:silent doautocmd User LoadQuickhl<CR>gv<Plug>(quickhl-manual-reset)

# roy-g-biv text colors
g:quickhl_manual_colors = [
  'term=bold,NONE cterm=bold,NONE ctermfg=9   gui=bold,NONE guifg=#FF0000',
  'term=bold,NONE cterm=bold,NONE ctermfg=202 gui=bold,NONE guifg=#FF5F00',
  'term=bold,NONE cterm=bold,NONE ctermfg=11  gui=bold,NONE guifg=#FFFF00',
  'term=bold,NONE cterm=bold,NONE ctermfg=10  gui=bold,NONE guifg=#00FF00',
  'term=bold,NONE cterm=bold,NONE ctermfg=12  gui=bold,NONE guifg=#0000FF',
  'term=bold,NONE cterm=bold,NONE ctermfg=55  gui=bold,NONE guifg=#5F00AF',
  'term=bold,NONE cterm=bold,NONE ctermfg=207 gui=bold,NONE guifg=#FF5FFF'
]

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
