" Vim syntax file
" Language:   Sylt
" Maintainer: Edvard Thörnros
"
" Shamelessly stolen from moon.vim
"

if exists("b:current_syntax") && b:current_syntax == "sy"
    finish
endif


syn keyword syltKeyword mod enum type def let in if end match with forall foreign class instance

syn region syltString start=/\v"/ skip=/\v\\./ end=/\v"/

syn keyword syltTodo contained TODO FIXME XXX NOTE
hi link syltTodo        Todo

hi link syltBool        Boolean
hi link syltString      String
hi link syltNumber      Number
hi link syltFloat       Float

syn match syltOp /\//
syn match syltOp /+/
syn match syltOp /-/
syn match syltOp /*/
syn match syltOp /'/
syn match syltOp /#/
syn match syltOp /$/

hi link syltOp       Operator

syn match syltKeyword /->/
syn match syltKeyword /:/
" syn match syltKeyword /-\[\[/
" syn match syltKeyword /\]\]-/
syn match syltKeyword /=/
syn match syltKeyword /\./

syn match syltFloat /\i\@<![-+]\?\d+\.\@<!\.\d\*\%([eE][+-]\?\d\+\)\?/ display
syn match syltNumber /\i\@<![-+]\?\d\+\%([eE][+-]\?\d\+\)\?/ display
syn match syltBool /true/ 
syn match syltBool /false/ 

hi link syltKeyword     Keyword


syn match syltComment "--.*$" contains=syltTodo,@Spell
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

" syn keyword syltType Bool Int Real Str
syn match syltType /[A-Z][A-Za-z]*/
hi link syltType        Type

syn include @SyltLua syntax/lua.vim
unlet b:current_syntax
" I couldn't get this to work - this was the closest I got after looking at
" the HTML template.
syn region Lua keepend start="-\[\["  end="\]\]-"hs=s+3,he=e-3 contains=@SyltLua
hi def link Lua Special

let b:current_syntax = "sy"
