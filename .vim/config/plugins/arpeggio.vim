" configure 34ms grace period for key chord entry
let g:arpeggio_timeoutlen = 34

" load kana/vim-arpeggio after configuring |g:arpeggio_timeoutlen|
silent! packadd vim-arpeggio

" escape
silent! Arpeggio noremap jk <ESC>
silent! Arpeggio inoremap jk <ESC>
silent! Arpeggio cnoremap jk <C-C>

" fmt lines with cursor position maintained
silent! Arpeggio nnoremap hl mzgqq`z
silent! Arpeggio vnoremap hl mzgq`z

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
