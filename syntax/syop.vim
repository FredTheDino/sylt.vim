" Vim syntax file
" Language:   Sylt-Operator
" Maintainer: Edvard Thörnros
"
" Shamelessly stolen from moon.vim
"

if exists("b:current_syntax") && b:current_syntax == "syop"
    finish
endif

syn keyword syltKeyword unary binr binl

syn match syltNumber /\i\@<![-+]\?\d\+\%([eE][+-]\?\d\+\)\?/ display
hi link syltNumber      Number

syn keyword syltTodo contained TODO FIXME XXX NOTE
hi link syltTodo        Todo

syn match syltKeyword /\./

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
