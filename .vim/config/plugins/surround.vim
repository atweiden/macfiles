vim9script

# disable insert mode mappings
g:surround_no_insert_mappings = 1

# disable automatic re-indenting
g:surround_indent = 0

# before | key in | after
# 'word' |  yssq  | “'word'”
g:surround_113 = "“\r”"

# before | key in | after
# 'word' |  yssQ  | ‘'word'’
g:surround_81 = "‘\r’"

# before | key in | after
# 'word' |  yssa  | «'word'»
g:surround_97 = "«\r»"

# before | key in | after
# 'word' |  yssA  | « 'word' »
g:surround_65 = "« \r »"

# before | key in | after
# 'word' |  yssb  | 「'word'」
g:surround_98 = "「\r」"

# before | key in | after
# 'word' |  yssB  | 「 'word' 」
g:surround_66 = "「 \r 」"

# before | key in | after
# 'word' |  yssc  | <['word']>
g:surround_99 = "<[\r]>"

# before | key in | after
# 'word' |  yssC  | <[ 'word' ]>
g:surround_67 = "<[ \r ]>"

# before | key in | after
# 'word' |  yssd  | ᚛'word'᚜
g:surround_100 = "᚛\r᚜"

# before | key in | after
# 'word' |  yssD  | ᚛ 'word' ᚜
g:surround_68 = "᚛ \r ᚜"

# before | key in | after
# 'word' |  ysse  | ⁅'word'⁆
g:surround_101 = "⁅\r⁆"

# before | key in | after
# 'word' |  yssE  | ⁅ 'word' ⁆
g:surround_69 = "⁅ \r ⁆"

# before | key in | after
# 'word' |  ysss  | ⟅'word'⟆
g:surround_115 = "⟅\r⟆"

# before | key in | after
# 'word' |  yssS  | ⟅ 'word' ⟆
g:surround_83 = "⟅ \r ⟆"

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
