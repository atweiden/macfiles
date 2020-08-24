" 0: F is backward search, and repeating f after F searches in the same direction
" 1: F is backward search, and repeating F after F searches in the same direction
let g:clever_f_fix_key_direction = 1

" don't mark cursor position in operator pending mode
let g:clever_f_mark_cursor = 0

" fix clever-f highlighting appearing too red in seoul256-light
augroup cleverf
  autocmd!
  autocmd VimEnter,ColorScheme * highlight CleverFDefaultLabel cterm=bold,underline ctermfg=red ctermbg=NONE gui=bold,underline guifg=#FF5FAF guibg=NONE
augroup END

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
