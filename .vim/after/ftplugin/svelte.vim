setlocal errorformat+=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#

setlocal makeprg=yarn\ --silent\ eslint\ --format\ compact
setlocal formatprg=yarn\ --silent\ prettier\ --stdin-filepath\ %
