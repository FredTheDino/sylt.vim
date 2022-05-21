" Vim syntax file
" Language:   Sylt
" Maintainer: Edvard Thörnros
"
" Shamelessly stolen from moon.vim
"

if exists("b:current_syntax") && b:current_syntax == "sy"
    finish
endif
let b:current_syntax = "sy"

syn keyword syltType bool int float void str

if !exists("sylt_no_large_first_implies_type")
    syn match syltType /[A-Z][A-Za-z]\*/
endif

syn keyword syltKeyword if elif else loop break continue in blob ret enum
                      \ fn use is do end and or not as external from case

syn match syltKeyword /->/
syn match syltKeyword /::/
syn match syltKeyword /:/

syn match syltFloat /\i\@<![-+]\?\d*\.\@<!\.\d\+\%([eE][+-]\?\d\+\)\?/ display
syn match syltFloat /\i\@<![-+]\?\d+\.\@<!\.\d\*\%([eE][+-]\?\d\+\)\?/ display
syn match syltNumber /\i\@<![-+]\?\d\+\%([eE][+-]\?\d\+\)\?/ display
syn match syltBool /true/ 
syn match syltBool /false/ 

syn region syltBlock start="\<\%(do\|enum\)\>" end="\<end\>" fold transparent
syn region syltString start='"' end='"'

syn keyword syltTodo contained TODO FIXME XXX NOTE
hi link syltTodo        Todo

hi link syltType        Type
hi link syltKeyword     Keyword

hi link syltBool        Boolean
hi link syltString      String
hi link syltNumber      Number
hi link syltFloat       Float

syn keyword syltSelf self
hi link syltSelf        Identifier

syn match syltOp /\//
syn match syltOp /++/
syn match syltOp /--/
syn match syltOp /*=/
syn match syltOp /\/=/
syn match syltOp /+=/
syn match syltOp /-=/
syn match syltOp /:=/
syn match syltOp /!=/
syn match syltOp /==/
syn match syltOp /<=/
syn match syltOp />=/

syn match syltOp /</
syn match syltOp />/
syn match syltOp /=/
syn match syltOp /+/
syn match syltOp /-/
syn match syltOp /*/
syn match syltOp /'/

syn match syltOp /|/
syn match syltOp /?/

hi link syltOp       Operator

syn match syltComment "//.*$" contains=syltTodo,@Spell
hi link syltComment     Comment

" An error for trailing whitespace
if !exists("sylt_no_trailing_space_error")
  syn match syltSpaceError /\s\+\(\%#\)\@!$/ display
  hi def link syltSpaceError Error
endif

if !exists("sylt_no_git_conflict_error")
  syn match syltGitError /<<<<<<</ display
  syn match syltGitError /=======/ display
  syn match syltGitError />>>>>>>/ display
  hi def link syltGitError Error
endif

" An error for trailing semicolons, for help transitioning from JavaScript
if !exists("sylt_no_trailing_semicolon_error")
  syn match syltSemicolonError /;$/ display
  hi def link syltSemicolonError Error
endif
