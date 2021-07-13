set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2


set errorformat+=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#

setlocal makeprg=yarn\ --silent\ eslint\ --format\ compact
setlocal formatprg=yarn\ --silent\ prettier\ --stdin-filepath\ %

" setlocal autoread
" augroup JS
"   autocmd! * <buffer>
"   autocmd BufWritePost <buffer> silent make <afile> | checktime | silent redraw!
" augroup END
