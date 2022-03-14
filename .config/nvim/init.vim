"------------------------------------------------
"██    ██ ██ ███    ███ ██████   ██████ 
"██    ██ ██ ████  ████ ██   ██ ██      
"██    ██ ██ ██ ████ ██ ██████  ██      
" ██  ██  ██ ██  ██  ██ ██   ██ ██      
"  ████   ██ ██      ██ ██   ██  ██████ 
"------------------------------------------------
" Author: Nicolas Shannon
" Desription: My personal .vimrc file
"------------------------------------------------

"------------------------------------------------
" --- |Pluggins| ---
"------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdtree'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'ap/vim-css-color'
Plug 'vimwiki/vimwiki'
Plug 'nvim-lualine/lualine.nvim'
" LSP and autocompletion
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Colorscheme add-ons
Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/edge'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ryanoasis/vim-devicons'
call plug#end()

" Remap <leader> key from to SPACE
let mapleader = "\<Space>" 

"------------------------------------------------
" --- |nvim-cmp setup| ---
"------------------------------------------------

set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Language server list 
  require('lspconfig').pyright.setup{}
  require('lspconfig').bashls.setup{}
  require('lspconfig').sumneko_lua.setup{}
  -- Lualine
  require('lualine').setup {
    options = {
      theme = 'gruvbox-material'
    }
  }
EOF

"------------------------------------------------
" --- |Pluggin Settings| ---
"------------------------------------------------

" Colorscheme plugin settings
let g:everforest_background = 'hard'
let g:gruvbox_material_background = 'soft'

" LLP configuration
" autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'zathura'
let g:livepreview_engine = 'pdflatex'
let g:livepreview_use_biber = 1

" markdown-preview 
let g:mkdp_browser = 'firefox'

" vimwiki
let g:vimwiki_list = [{'path': '~/Documents/wiki/', 'path_html': '~/Documents/public_html/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"------------------------------------------------
" --- |Remaps| ---
"------------------------------------------------

" Nerdtree
noremap <leader>n :NERDTreeToggle<CR>
" NerdTree navigation
nnoremap <C-H> :tabprevious<CR>
nnoremap <C-L> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>

" Telescope 
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"------------------------------------------------
" --- |Auto Commands| ---
"------------------------------------------------

" Autocompile code
" Python
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
" Lua
autocmd FileType lua map <buffer> <F9> :w<CR>:exec '!lua' shellescape(@%, 1)<CR>
autocmd FileType lua imap <buffer> <F9> <esc>:w<CR>:exec '!lua' shellescape(@%, 1)<CR>
" LLPStartPreview for Latex
autocmd FileType tex map <buffer> <F9> :w<CR>:LLPStartPreview<CR>
autocmd FileType tex imap <buffer> <F9> <esc>:w<CR>:LLPStartPreview<CR>
" Markdown
autocmd FileType markdown map <buffer> <F9> :w<CR>:MarkdownPreview<CR>
autocmd FileType markdown imap <buffer> <F9> <esc>:w<CR>:MarkdownPreview<CR>
" init.vim reload
autocmd FileType vim map <buffer> <F9> :w<CR>:so %<CR>
autocmd FileType vim imap <buffer> <F9> <esc>:w<CR>:so %<CR>
" Make calcurse notes markdown compatible
autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown

"------------------------------------------------
" --- Standard nvim settings ---
"------------------------------------------------

" Set 'nocompatible' for issues with distro
set nocompatible
filetype plugin on

if has('termguicolors')
    set termguicolors
endif

colorscheme gruvbox-material
set background=dark

"set hi Normal guibg=NONE ctermbg=None
" Use this to preserve transpareny
"au ColorScheme * hi Normal ctermbg=none guibg=none

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

