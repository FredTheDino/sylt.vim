" Language: Sylt

if exists("b:did_indent")
    finish
endif

let b:did_indent = 1

setlocal indentexpr=GetSyltIndent(v:lnum)

" Enable automatic indent when writing 'end'
setlocal indentkeys+=0=end

" Indent automatically when writing
setlocal autoindent

if exists("*GetSyltIndent")
    finish
endif

let s:COMMENT = '^\s*//'

func! s:GetPrevCodeLineNum(line_num)
    let nline = a:line_num
    while nline > 0
        let nline = prevnonblank(nline-1)
        if getline(nline) !~? s:COMMENT
            break
        endif
    endwhile
    return nline
endfunc

func! GetSyltIndent(line_num)
    if a:line_num == 0
        return 0
    endif

    let this_line = getline(a:line_num)

    let prev_codeline_num = s:GetPrevCodeLineNum(a:line_num)
    let prev_codeline = getline(prev_codeline_num)
    let prev_indent = indent(prev_codeline_num)

    if this_line =~ s:COMMENT
        return -1
    endif

    let ident = prev_indent

    if match(prev_codeline, '\(\<\%(do\|enum\)\>\|[\|{\|(\)$') != -1
        let ident = ident + shiftwidth()
    endif

    if match(this_line, '^\s*\(\<end\>\|\<else\>\|]\|}\|)\)$') != -1
        let ident = ident - shiftwidth()
    endif

    return ident
endfunc
