" Set default encoding
set encoding=utf-8
set filetype=unix

" Download vim-plug and install plugins when nvim is first run
" Prefer to use XDG directory structure for nvim, otherwise the usual location
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Define plugins for vim-plug to load
call plug#begin(data_dir.'/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
call plug#end()

" Plugin options
let g:nord_uniform_diff_background = 1
let g:lightline = { 
  \ 'colorscheme': 'nord',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'gitbranch#name'
  \ },
\ }

" Remap leader to spacebar
let mapleader=" "

" File management, temp files, and history
set nobackup
set nowritebackup
set noswapfile
set nomodeline
set history=100
set modelines=2

" Search and matching
set hlsearch
set incsearch
set wrapscan
set noshowmatch
let g:loaded_matchparen=1

" Manage tabs and spacing
set smarttab
set expandtab
set shiftround
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Window and pane management
set splitbelow
set splitright
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Configure rulers and line number settings
set ruler
set cursorline
set noshowmode
set number
set relativenumber
set numberwidth=5
set laststatus=2

" Indentation and syntax
set autoindent
filetype on
filetype plugin indent on
syntax on

" Colors and appearance
if !has('gui_running')
  set t_Co=256
endif
colorscheme nord

" Custom shortcut mappings
set timeoutlen=300
inoremap jk <ESC>
nnoremap <leader>num :set number!<CR>
nnoremap <leader>rel :set relativenumber!<CR>
nnoremap <leader>h :noh<CR>
nnoremap <leader>n :NERDTreeToggle<CR>

" Filetype specifics
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set softtabstop=4

