setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

" highlight gnu gcc specific items
let c_gnu = 1

" highlight whitespace before tab as error
let c_space_errors = 1
let c_no_trail_space_error = 1

" use c syntax for header files
let c_syntax_for_h = 1

" don't fold comments when foldmethod is syntax
let c_no_comment_fold = 1

" don't fold preprocessor if-statements when foldmethod is syntax
let c_no_if0_fold = 1

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
