vim9script

# 0: F is backward search, and repeating f after F searches in the same direction
# 1: F is backward search, and repeating F after F searches in the same direction
g:clever_f_fix_key_direction = 1

# don't mark cursor position in operator pending mode
g:clever_f_mark_cursor = 0

def HighlightCleverF(): void
  highlight clear CleverFDefaultLabel
  highlight CleverFDefaultLabel cterm=bold,underline ctermfg=red ctermbg=NONE gui=bold,underline guifg=#FF5FAF guibg=NONE
enddef

# fix clever-f highlighting appearing too red in seoul256-light
augroup cleverf
  autocmd!
  autocmd VimEnter,ColorScheme * HighlightCleverF()
augroup END

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
