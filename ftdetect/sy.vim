" Vim syntax file
" Language:   Sylt
" Maintainer: Edvard Thörnros

autocmd BufNewFile,BufRead *.sy set filetype=sy
autocmd BufNewFile,BufRead *.syop set filetype=syop

function! s:DetectSy()
    if getline(1) =~ '^#!.*\<sy\>'
        set filetype=sylt
    endif
    if getline(1) =~ '^#!.*\<syop\>'
        set filetype=syop
    endif
endfunction

autocmd BufNewFile,BufRead * call s:DetectSy()
