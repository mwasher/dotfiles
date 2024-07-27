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
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'projekt0n/github-nvim-theme'
call plug#end()

" Plugin options
let g:NERDTreeShowHidden = 1
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

function! LightlineLineinfo() abort
    if winwidth(0) < 86
        return ''
    endif

    let l:current_line = printf('%-3s', line('.'))
    let l:max_line = printf('%-3s', line('$'))
    let l:lineinfo = ' ' . l:current_line . '/' . l:max_line
    return l:lineinfo
endfunction

" Python
if exists("$VIRTUAL_ENV")
  let g:python3_host_prog = $VIRTUAL_ENV . '/bin/python3'
endif

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
nnoremap <C-p> <C-w>p

" Configure rulers and line number settings
set ruler
set number
set relativenumber
set numberwidth=5
set laststatus=2
set noshowmode

" Indentation and syntax
set autoindent
filetype on
filetype plugin indent on
syntax on

" Colors and appearance
if !has('gui_running')
  set t_Co=256
endif
colorscheme github_dark_dimmed

" Custom shortcut mappings
set timeoutlen=500
inoremap jk <ESC>
nnoremap <leader>num :set number!<CR>
nnoremap <leader>rel :set relativenumber!<CR>
nnoremap <leader>h   :noh<CR>
nnoremap <leader>w   :tabnew<CR>
nnoremap <leader>e   :tabnext<CR>
nnoremap <leader>q   :tabprev<CR>
nnoremap <leader>a   :bnext<CR>
nnoremap <leader>t   :NERDTreeToggle<CR>
nnoremap <leader>ff  :Telescope find_files hidden=true<CR>
nnoremap <leader>fg  :Telescope live_grep<CR>
nnoremap <leader>fb  :Telescope buffers<CR>
nnoremap <leader>fh  :Telescope help_tags<CR>

" Filetype specifics
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set softtabstop=4

