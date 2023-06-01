" Global Configuration Options {{{1
" Finding Files {{{2
"
set path+=**                                                                " fuzzy matching with :find *.ext*
set wildignore+=**/node_modules/**                                          " Ignore some folders
set wildignore+=**/.git/**
set wildignore+=**/build/**
set wildignore+=**/dist/**

" Autocomplete {{{2
set wildmode=longest,list,full                " complete longest common prefix before full

" Backup {{{2
set nowritebackup
set noswapfile

" Visual Indicator {{{2
set colorcolumn=81                                                          " Set the 80 character column (+1 if textwidth is defined else 81)
set cursorline                                                              " Highlight the current line
set number
set hidden                                                                  " Any buffer can be hidden

" Writing {{{2
set lazyredraw                                                              " Render window only after the end of a macro
set nojoinspaces                                                            " Prevents inserting two spaces after punctuation on a join (J)
set showmatch                                                               " Show current brackets

" Scrolling {{{2
set scrolljump=5                                                            " Lines to scroll when cursor leaves screen
set scrolloff=3                                                             " Minimum lines to keep above and below cursor

" Window {{{2
set splitbelow                                                              " Puts new split windows to the bottom of the current
set splitright                                                              " Puts new vsplit windows to the right of the current
set winminheight=0                                                          " Windows can be 0 line height
set updatetime=100                                                          " Faster refresh  time

" Folding {{{2
"set foldmethod=syntax                                                       " Fold are defined by syntax highlighting
"set foldlevel=2

" Indentation {{{2
" Don't enable smarindent or cindent with filetype plugin indent on
filetype plugin indent on                                                   " Indentation based on filetype

" Invisible characters {{{2
set list

" Mouse {{{2
set mouse=a

" Search {{{2
set ignorecase                                                              " Case insensitive search
set smartcase                                                               " Case sensitive only if search contains uppercase letter.
j
" Tabulation and spaces {{{2
set expandtab                                                               " Show spaces instead of tabs
set shiftwidth=0                                                            " columns per <<
set softtabstop=2                                                          " spaces per tab
set tabstop=2                                                               " columns per tabs

" Wrapping {{{2
set nowrap

" StatusLine {{{2
set statusline=%t                                       " tail of the filename
set statusline+=\ %h                                    " help file flag
set statusline+=%m                                      " modified flag
set statusline+=%r                                      " read only flag
set statusline+=%y                                      " filetype
set statusline+=%=                                      " left/right separator
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'},       " file encoding
set statusline+=%{&ff}]\                                " file format
set statusline+=%c\                                     " cursor column
set statusline+=%l/%L\                                  " cursor line/total lines

" Mappings {{{1 

" Leader {{{2
let mapleader = ","
let g:mapleader = ","

" Fast saving {{{2
nmap <leader>w :w!<cr>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Search {{{2
" map <space> /
" map <c-space> ?
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Windows {{{2
noremap <leader>h <C-w>s
noremap <leader>v <C-w>v
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Buffers {{{2
noremap <leader>bq :q<cr>
map <leader>bd :Bclose<cr>
map <leader>ba :bufdo bd<cr>
map <leader>bo :only<cr>

" Tabs {{{2
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
noremap <S-l> gt
noremap <S-h> gT
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Remap VIM 0 to first non-blank character
noremap 0 ^
noremap ^ 0


" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Colorscheme {{{2

" Netrw {{{2
let g:netrw_banner = 0


" vim:fdm=marker:fdl=1
