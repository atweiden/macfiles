vim9script

import autoload $ALDPATH .. '/cycle_focus_win.vim' as cycle
command! DisableLeftPadding cycle.DisableLeftPadding()
command! EnableLeftPadding cycle.EnableLeftPadding()
command! CycleFocusWin cycle.CycleFocusWin()
command! ToggleLeftPadding cycle.ToggleLeftPadding()
command! ToggleLineNumbers cycle.ToggleLineNumbers()
command! ToggleLineNumbersLeftPadded cycle.ToggleLineNumbersLeftPadded()

import autoload $ALDPATH .. '/focus_line.vim' as focus
command! FocusLine focus.FocusLine()

import autoload $ALDPATH .. '/return_to_last_edit_position.vim' as pos
command! ReturnToLastEditPosition pos.ReturnToLastEditPosition()

import autoload $ALDPATH .. '/set_list_chars.vim' as listchars
command! SetListCharsTabVisible listchars.SetListCharsTabVisible()
command! SetListCharsTabInvisible listchars.SetListCharsTabInvisible()
command! SetListCharsRemaining listchars.SetListCharsRemaining()

import autoload $ALDPATH .. '/syntax_item.vim' as synitem
command! SyntaxItem echo synitem.SyntaxItem()

import autoload $ALDPATH .. '/tabstop.vim'
command! TabstopSet tabstop.TabstopSet()
command! TabstopSummarize tabstop.TabstopSummarize()

import autoload $ALDPATH .. '/toggle_colors.vim' as togglecolors
command! ToggleColors togglecolors.ToggleColors()

import autoload $ALDPATH .. '/toggle_conceal.vim' as toggleconceal
command! ToggleConceal toggleconceal.ToggleConceal()

import autoload $ALDPATH .. '/toggle_cursorcolumn_cursorline.vim' as togglecur
command! ToggleCursorcolumnCursorline togglecur.ToggleCursorcolumnCursorline()

import autoload $ALDPATH .. '/toggle_hex_mode.vim' as togglehex
command! ToggleHexMode togglehex.ToggleHexMode()

import autoload $ALDPATH .. '/toggle_laststatus.vim' as togglels
command! ToggleLaststatus togglels.ToggleLaststatus()

import autoload $ALDPATH .. '/toggle_virtualedit.vim' as toggleve
command! ToggleVirtualedit toggleve.ToggleVirtualedit()

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
