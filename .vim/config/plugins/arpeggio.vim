vim9script

# configure 34ms grace period for key chord entry
g:arpeggio_timeoutlen = 34

# escape
silent! packadd vim-arpeggio
silent! Arpeggio inoremap jk <ESC>
silent! Arpeggio vnoremap jk <ESC>
silent! Arpeggio cnoremap jk <C-C>

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
