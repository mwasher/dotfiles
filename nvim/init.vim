" Set default encoding
set encoding=utf-8
set filetype=unix

" Download and setup vim-plug when nvim is run
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Define plugins for vim-plug to load
call plug#begin('~/.config/nvim/plugged')
call plug#end()

" Remap leader to spacebar
let mapleader=" "

" File management, temp files, and history
set nobackup
set nowritebackup
set noswapfile
set history=100
set nomodeline
set modelines=2

" Search and matching
set hlsearch
set incsearch
set wrapscan
let g:loaded_matchparen=1
set noshowmatch

" Manage tabs and spacing
set smarttab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround


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
set laststatus=2
set number
set relativenumber
set numberwidth=5
nnoremap <leader>num :set number!<CR>
nnoremap <leader>rel :set relativenumber!<CR>

" Indentation and syntax
set autoindent
filetype on
filetype plugin indent on
syntax on

" Custom shortcut mappings
set timeoutlen=500
nnoremap <leader>h :noh<CR>
inoremap jk <ESC>

" Filetype specifics
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set softtabstop=4

