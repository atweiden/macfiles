nnoremap <leader>pe :%!enchive archive \| base64<CR>
nnoremap <leader>pd :%!base64 -d \| enchive --agent --pinentry extract<CR>
vnoremap <leader>pe :'<,'>!enchive archive \| base64<CR>
vnoremap <leader>pd :'<,'>!base64 -d \| enchive --agent --pinentry extract<CR>

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
