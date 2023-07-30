" Author: coolaj86 (AJ ONeal) <coolaj86@proton.me>
" Description: Integration of AJScript Formatter with ALE.

call ale#Set('javascript_ajscript_fmt_executable', 'ajscript-fmt')
call ale#Set('javascript_ajscript_fmt_use_global', get(g:, 'ale_use_global_executables', 0))
call ale#Set('javascript_ajscript_fmt_options', '')

" function! ale#fixers#ajscript_fmt#GetExecutable(buffer) abort
function! ajscript#fixers#ajscript_fmt#GetExecutable(buffer) abort
    return ale#path#FindExecutable(a:buffer, 'javascript_ajscript_fmt', [
    \   'node_modules/ajscript-cli/bin/fmt.js',
    \   'node_modules/.bin/ajscript-fmt',
    \])
endfunction

" function! ale#fixers#ajscript_fmt#Fix(buffer) abort
function! ajscript#fixers#ajscript_fmt#Fix(buffer) abort
    let l:executable = ale#Var(a:buffer, 'javascript_ajscript_fmt_executable')
    let l:options = ale#Var(a:buffer, 'javascript_ajscript_fmt_options')

    if !executable(l:executable)
        return 0
    endif

    return {
    \   'command': ale#Escape(l:executable)
    \       . ' fmt'
    \       . ale#Pad(l:options)
    \       . ' --stdin-filepath %s',
    \}

    " seems to have an issue reading from stdin when writing to stdout
    " return {
    " \   'command': ale#Escape(l:executable)
    " \       . ' fmt'
    " \       . ale#Pad(l:options)
    " \       . ' --stdin-filepath %s -o %t',
    " \   'read_temporary_file': 1,
    " \}
endfunction
