call plug#begin('~/.vim/plugged')
" Language
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
" Integration
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'
"  Interface
Plug 'unblevable/quick-scope'
" Commands
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-projectionist'
Plug 'wellle/targets.vim'
Plug 'igemnace/vim-makery'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'sbdchd/neoformat'
" Code Display
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'

call plug#end()


syntax on
if !exists('g:path_modified')
  let $PATH .= ':/Users/hash/.nvm/versions/node/v12.22.1/bin:/Users/hash/Projects/flutter/bin'
endif

let g:path_modified = 1

" Generic config {{{1
" General {{{2
set nobackup                    " no backup - use git like a normal person
set noswapfile                  " no swap file
set vb                          " kill sounds
set fileformat=unix             " unix file format by default
set fileformats=unix,dos,mac    " available formats
set spelllang=en_us             " current language
set formatoptions=qroct
" UI {{{2
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set winminheight=0              " Windows can be 0 line high
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set guioptions-=T               " Remove the toolbar
set splitbelow                  " horizontal windows always split below
set splitright                  " vertical windows always split right
set completeopt-=preview        " auto complete menu
set title                       " show window title
set ls=2
set ruler
set showtabline=2
set showcmd
set cursorline                  " highlight the current line
set background=dark             " use a dark scheme
" Keys {{{2
set backspace=indent,eol,start  " Backspace for dummies
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set autoindent                  " autoindent when pressing Enter

" Fuzzy matching {{{2
set path+=**                                                                " fuzzy matching with :find *.ext*
set wildignore+=**/node_modules/**                                          " Ignore some folders
set wildignore+=**/.git/**
set wildignore+=**/build/**
set wildignore+=**/dist/**
set wildignore+=**/Pods/**
set wildignore+=**/android/**
set wildignore+=**/ios/**
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
" Folding {{{2
set foldmethod=syntax                                                       " Fold are defined by syntax highlighting
" Invisible characters {{{2
set list                        " Show problematic spaces
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
" Searching {{{2
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
" Tabulation and spaces {{{2
set expandtab                                                               " Show spaces instead of tabs
set shiftwidth=0                                                            " columns per <<
set softtabstop=2                                                          " spaces per tab
set tabstop=2                                                               " columns per tabs
" Wrapping {{{2
set nowrap                      " disable line wrapping

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
" Buffers {{{2
noremap <leader>bq :q<cr>
map <leader>bd :Bclose<cr>
map <leader>ba :bufdo bd<cr>
map <leader>bo :only<cr>
" Search {{{2
map <space> /
map <c-space> ?
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
" Windows {{{2
noremap <leader>h <C-w>s
noremap <leader>v <C-w>v
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

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
" Remap VIM 0 to first non-blank character
noremap 0 ^
noremap ^ 0
" Git {{{2
nmap <leader>gs :Gstatus<CR>
" Neoformat {{{2
nmap <leader>d :Neoformat<cr>
" FZF {{{2
nmap <leader>fb :Buffers<cr>
nmap <leader>ff :Files<cr>
nnoremap <leader>fg :Ag<space>

" Plugin Configuration {{{1
" FZF {{{2
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
" Emmet {{{2
let g:user_emmet_settings = {
            \ 'javascript.jsx' : {
            \     'extends' : 'jsx',
            \ },
        \ }
" NeoFormat {{{2
let g:neoformat_try_formatprg = 1
let g:neoformat_dart_flutter = {
      \ 'exe': 'flutter',
      \ 'args': ['format'],
      \ 'replace': 1,
      \ }

let g:neoformat_enabled_dart = ['flutter']

" Snipmate {{{2
let g:snipMate = { 'snippet_version': 0 }

colorscheme gruvbox


" vim:fdm=marker:fdl=1
