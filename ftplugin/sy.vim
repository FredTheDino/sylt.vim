" Sylt filetype plugin file
" Language: Sylt

" Avoid loading multiple filetypes
if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

if exists("loaded_matchit")
    let b:match_ignorecase = 0
    " Works okay, does not consider case when do is implicit (fn ->)
    let b:match_words .= '\<\%(match|enum\)\>:\<end\>'
    let b:match_words .= '\<-\[\[\>:\<\]\]-\>'
    let b:match_skip = 's:syltComment\|syltString'
endif " exists("loaded_matchit")

setlocal commentstring=--\ %s

let &cpo = s:cpo_save
unlet s:cpo_save
