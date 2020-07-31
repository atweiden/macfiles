setlocal viminfo=
setlocal nobackup
setlocal noswapfile
setlocal noundofile
setlocal nowritebackup
setlocal noshelltemp
setlocal history=0
setlocal cryptmethod=blowfish2

nnoremap <leader>e :%!enchive archive \| base64<CR>
nnoremap <leader>d :%!base64 -d \| enchive --agent --pinentry extract<CR>
vnoremap <leader>e :'<,'>!enchive archive \| base64<CR>
vnoremap <leader>d :'<,'>!base64 -d \| enchive --agent --pinentry extract<CR>

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
