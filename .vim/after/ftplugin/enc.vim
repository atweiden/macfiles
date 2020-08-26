nnoremap <silent> <buffer> <localleader>e :%!enchive archive \| base64<CR>
nnoremap <silent> <buffer> <localleader>d :%!base64 -d \| enchive --agent --pinentry extract<CR>
vnoremap <silent> <buffer> <localleader>e :'<,'>!enchive archive \| base64<CR>
vnoremap <silent> <buffer> <localleader>d :'<,'>!base64 -d \| enchive --agent --pinentry extract<CR>

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
