" Author: Nicolas Shannon
" Desription: My personal .vimrc file
"
"-----------------------------------

" Pluggins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'morhetz/gruvbox'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()
"-----------------------------------
"---------Pluggin Settings----------

" LLP configuration
" autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'okular'
let g:livepreview_engine = 'pdflatex'
"-----------------------------------
" Set 'nocompatible' for issues with distro
set nocompatible

colorscheme gruvbox
au ColorScheme * hi Normal ctermbg=none guibg=none
"set termguicolors

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
set exrc
set guicursor=

" Allows reuse of same window after closing
set hidden

set noerrorbells
" Better cli completion
set wildmenu

" No highlighted searches
set nohlsearch
set incsearch

set nowrap
set scrolloff=8
" Ignore swap files
set noswapfile
set nobackup
" Ingore case, except when using capitals
set ignorecase
set smartcase

" Line numbering
set number
set relativenumber
set nu

" Tab spacing
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

