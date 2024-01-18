syntax on                   " syntax highlighting


"setlocal spell              " spell correcting
"set spelllang=nl,en_gb      " spell correcting
 " inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u 

set number
set relativenumber
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " for disabling automatic newline comments
set shiftwidth=4
set autoindent
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space

set cmdheight=2             " display for completion messages
set updatetime=300          " default 4000 is long
set shortmess+=c            " something related to coc
set signcolumn=yes          " same as above

set nocompatible            " disable compatibility to old-time vi
set ignorecase              " case insensitive 
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.


command! TermNew execute 'terminal' | execute 'bdel! #'

nnoremap <SPACE> <Nop>

let mapleader="\<Space>"

filetype plugin on

inoremap <esc> <esc>:w<enter>
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>
nnoremap gn :bn<enter>
nnoremap gp :bp<enter>
nnoremap ga <C-^>
nnoremap <C-j> <C-d>zz
nnoremap <C-k> <C-u>zz
nnoremap <leader>ä :terminal<enter>:file localhost_terminal<enter>
nnoremap <leader>t :b localhost_terminal<enter>i<C-c><Up><enter><C-\><C-n>
vnoremap <C-j> <C-d>zz
vnoremap <C-k> <C-u>zz
nnoremap gy ggVG"+y
vnoremap gy "+y
nnoremap <leader>c :!g++ -std=c++20 problem.cpp<enter>
nnoremap <leader>r <enter>:!./a.out<enter>
nnoremap <leader>m :NERDTreeToggle<enter>
tnoremap <Esc> <C-\><C-n>
nnoremap : :<C-f>i
nnoremap n nzz
nnoremap N Nzz




inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

imap ö <C-y>



verbose imap <tab>



" PLUGINS

call plug#begin()

Plug 'rebelot/terminal.nvim'

Plug 'mhartington/formatter.nvim'

" Github Copilot
Plug 'github/copilot.vim'


" THEMES
Plug 'arcticicestudio/nord-vim'

" LSP
"Plug 'prabirshrestha/vim-lsp'
" LSP-settings
"Plug 'mattn/vim-lsp-settings'

" Live html preview
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'ray-x/web-tools.nvim'
Plug 'https://github.com/wolandark/vim-live-server.git'




" CODE COMPLETION
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" c/c++ completion
"Plug 'deoplete-plugins/deoplete-clang'

" To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/rust-tools.nvim'


" FILE TREE
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }


" HIGHLIGHTING
" Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


" FUZZY FILE FINDER
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }


" IDK WHAT THESE ARE JUST SCARED TO REMOVE
" Collection of common configurations for the Nvim LSP client
"Plug 'neovim/nvim-lspconfig'
call plug#end()


colorscheme nord " theme
