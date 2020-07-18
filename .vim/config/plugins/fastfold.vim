" don't hijack z* commands to update folds, use :FastFoldUpdate instead
let g:fastfold_fold_command_suffixes = []
let g:fastfold_fold_movement_commands = []

" don't automatically update folds when saving buffer
let g:fastfold_savehook = 0

" don't map zuz to :FastFoldUpdate!
nmap <SID>(DisableFastFoldUpdate) <Plug>(FastFoldUpdate)

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
