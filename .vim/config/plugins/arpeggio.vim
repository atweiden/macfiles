" configure 34ms grace period for key chord entry
let g:arpeggio_timeoutlen = 34

" bind escape key
silent! call arpeggio#load()
silent! Arpeggio noremap jk <ESC>
silent! Arpeggio inoremap jk <ESC>
silent! Arpeggio cnoremap jk <C-C>

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
