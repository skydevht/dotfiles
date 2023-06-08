set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

setlocal formatprg=npx\ prettier

" setlocal autoread
" augroup JS
"   autocmd! * <buffer>
"   autocmd BufWritePost <buffer> silent make <afile> | checktime | silent redraw!
" augroup END
