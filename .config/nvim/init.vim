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
Plug 'sainnhe/everforest'
Plug 'preservim/nerdtree'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()

"-----------------------------------
"---------Pluggin Settings----------

" LLP configuration
" autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'zathura'
let g:livepreview_engine = 'pdflatex'

" Colorscheme plugin settings
let g:everforest_background = 'soft'
let g:everforest_transparent_background = 1

"-----------------------------------

" Autocompile python code
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

"-----------------------------------

" Toggle background transparency
let t:is_transparent = 0                                                                        
function! Toggle_transparent_background()                                                       
  if t:is_transparent == 0                                                                      
    hi Normal guibg=#363836 ctermbg=black
    let t:is_transparent = 1                                                                    
  else                                                                                          
    hi Normal guibg=NONE ctermbg=NONE                                                           
    let t:is_transparent = 0                                                                  
  endif                                                                                         
endfunction                                     
"nnoremap <C-x><C-t> :call Toggle_transparent_background()<CR>
nnoremap <F3> :call Toggle_transparent_background()<CR>

"-----------------------------------

" Set 'nocompatible' for issues with distro
set nocompatible

"colorscheme gruvbox
colorscheme everforest
set background=dark
" Use this to keep transparency effect
au ColorScheme * hi Normal ctermbg=none guibg=none

if has('termguicolors')
    set termguicolors
endif

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

