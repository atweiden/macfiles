" use <localleader> prefix for conjure ft-specific shortcuts
let g:conjure#mapping#prefix = "<localleader>"

" use <leader> prefix for conjure global shortcuts
let g:conjure#mapping#log_split = [',ls']
let g:conjure#mapping#log_vsplit = [',lv']
let g:conjure#mapping#log_tab = [',lt']
let g:conjure#mapping#log_close_visible = [',lq']
let g:conjure#mapping#eval_current_form = [',ee']
let g:conjure#mapping#eval_root_form = [',er']
let g:conjure#mapping#eval_replace_form = [',e!']
let g:conjure#mapping#eval_marked_form = [',em']
let g:conjure#mapping#eval_word = [',ew']
let g:conjure#mapping#eval_file = [',ef']
let g:conjure#mapping#eval_buf = [',eb']
let g:conjure#mapping#eval_visual = [',E']
let g:conjure#mapping#eval_motion = [',E']

" don't nmap K, gd respectively
let g:conjure#mapping#def_word = v:false
let g:conjure#mapping#doc_word = v:false

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
