vim9script

# facilitate lazy loading
augroup loadctrlsf
  autocmd!
  autocmd User LoadCtrlSF ++once packadd ctrlsf.vim
augroup END

def LoadCtrlSFCompletion(arglead: string, cmdline: string, cursorpos: number): list<string>
  silent doautocmd User LoadCtrlSF
  return ctrlsf#comp#Completion(arglead, cmdline, cursorpos)
enddef

# quick launch with Ctrl-F
command! -nargs=* -complete=customlist,<SID>LoadCtrlSFCompletion CtrlSF :silent doautocmd User LoadCtrlSF | CtrlSF <args>
nnoremap <C-F> :CtrlSF<space>

# toggle results pane with F1
nnoremap <silent> <F1> :silent doautocmd User LoadCtrlSF<CR>:CtrlSFToggle<CR>

# start searches without explicit search path from project vcs root
# gleaned from current file, or from cwd if project vcs root not found
g:ctrlsf_default_root = 'project+fw'

# enter search regexes by default
g:ctrlsf_regex_pattern = 1

# don't follow symlinks
g:ctrlsf_follow_symlinks = 0

# point ctrlsf to xdg directory spec respecting search util config files
g:ctrlsf_extra_backend_args = { ack: "--ackrc=" .. $HOME .. "/.config/ack/ackrc",
                                ag: "--path-to-ignore " .. $HOME .. "/.config/search/ignore",
                                rg: "--ignore-file " .. $HOME .. "/.config/search/ignore" }

# open results pane on left at 70% of current vim window width
g:ctrlsf_position = "left"
g:ctrlsf_winsize = "70%"

# focus results pane at start of search
g:ctrlsf_auto_focus = { at: "start" }

# don't use Ctrl-{J,K} for next/prev in results pane
g:ctrlsf_mapping = { next: "<C-N>",
                     prev: "<C-P>" }

def CtrlSFAfterMainWindowInit(): void
  def CtrlSFAfterMainWindowInit(): void
    ctrlsf#JumpTo('open')
    ctrlsf#win#FocusMainWindow()
  enddef
  setlocal nowrap
  nnoremap <silent> <buffer> <CR> CtrlSFAfterMainWindowInit()<CR>
  nnoremap <silent> <buffer> o CtrlSFAfterMainWindowInit()<CR>
enddef

g:CtrlSFAfterMainWindowInit = CtrlSFAfterMainWindowInit

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
