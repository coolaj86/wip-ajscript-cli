" ajscript
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.a.js set filetype=ajscript
    au BufNewFile,BufRead *.a.js set syntax=javascript
augroup END

call ale#fix#registry#Add(
\  'ajscript-fmt',
\  'ajscript#fixers#ajscript_fmt#Fix',
\  ['javascript', 'ajscript'],
\  'Apply AJScript format to a file.'
\)

" call ale#fix#registry#Add(
" \  'ajscript-fmt',
" \  'ale#fixers#ajscript_fmt#Fix',
" \  ['javascript', 'ajscript'],
" \  'Apply AJScript format to a file.'
" \)
