" Vim syntax file
" Language: mochi

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

set tabstop=4
set shiftwidth=4

syn keyword mocKeyword include struct enum pub fn while do break continue as cast else if match inline interface impl union var mut requires return
syn match mocKeyword "\v<(deref|set|cast)[ibcp]>"

syn keyword mocBool true false
syn keyword mocType u64 u8 char bool
syn match mocType "\<[A-Z][A-Za-z0-9_]*\>"
syn match mocConstant "\<[A-Z][A-Z0-9_]\+\>" display

syn match mocFunction "\zs\([A-Za-z_][A-Za-z0-9_]*\)*\s*\ze\(<.*>\)\?("

syn match mocNumber "\<[0-9][0-9_]*\(u8\)\?\>" display

syn region mocString start=/"/ end=/"/ contains=mocEscapes
syn match mocChar "'\\\?.'" display contains=mocEscapes
syntax match mocEscapes display contained "\\[nr\"'t]"

syntax keyword mocTodos TODO NOTE
syn region mocComment start="//" end=/$/ contains=mocTodos

" links
hi def link mocKeyword  Keyword
hi def link mocBool     Boolean
hi def link mocType     Type
hi def link mocConstant Constant
hi def link mocFunction Function
hi def link mocNumber   Number
hi def link mocString   String
hi def link mocChar     Character
hi def link mocComment  Comment

let b:current_syntax = "mochi"
