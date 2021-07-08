" Author: Nicolas Shannon
" Desription: My personal .vimrc file
"
"-----------------------------------

" Pluggins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
call plug#end()

"-----------------------------------
"---------Pluggin Settings----------

" LLP configuration
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'zathura'
let g:livepreview_engine = 'pdflatex'
"-----------------------------------
" Set 'nocompatible' for issues with distro
set nocompatible

" Attempt to determine type of a file based on its name
if has('filetype')
  filetype indent plugin on
endif

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" Enable use of the mouse
if has('mouse')
  set mouse=a
endif
" Colorscheme
"colorscheme pablo 
colorscheme pablo
" Allows reuse of same window after closing
set hidden

" Better cli completion
set wildmenu

" Highlight searches
set hlsearch

" Ingore case, except when using capitals
set ignorecase
set smartcase

" Set number of lines
set number

"----------------------------------------
" Indentation options

"set shiftwidth=4
"set softtabstop=4
"set expandtab

" Set tabsize to 3
set ts=3

