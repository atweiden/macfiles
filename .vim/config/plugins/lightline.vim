vim9script

import $ALDPATH .. '/lightline.vim'

g:LightlineFileEncoding = lightline.FileEncoding
g:LightlineFileFormat = lightline.FileFormat
g:LightlineFileName = lightline.FileName
g:LightlineFileType = lightline.FileType
g:LightlineGitBranch = lightline.GitBranch
g:LightlineMode = lightline.Mode

g:lightline = { colorscheme: g:lightline_colorscheme,
                mode_map: { c: 'NORMAL' },
                active: { left: [ [ 'mode', 'paste' ], [ 'gitbranch', 'filename' ] ],
                          right: [ [ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ] ] },
                component_function: { gitbranch: 'g:LightlineGitBranch',
                                      filename: 'g:LightlineFileName',
                                      fileformat: 'g:LightlineFileFormat',
                                      filetype: 'g:LightlineFileType',
                                      fileencoding: 'g:LightlineFileEncoding',
                                      mode: 'g:LightlineMode' },
                separator: { left: '', right: '' },
                subseparator: { left: '', right: '' },
                tab: { active: [ 'tabnum', 'lightlinetabname', 'lightlinetabmodified' ],
                       inactive: [ 'tabnum', 'lightlinetabname', 'lightlinetabmodified' ] },
                tab_component_function: { lightlinetabname: 'lightline#tab#filename',
                                          lightlinetabmodified: 'lightline#tab#modified',
                                          readonly: 'lightline#tab#readonly',
                                          tabnum: 'lightline#tab#tabnum' } }

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
