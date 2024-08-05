vim.g.mapleader = ' '

vim.opt.encoding = 'utf-8'
vim.opt.backspace = 'indent,eol,start'    -- backspace deletes tabs when expandtab true
vim.opt.history = 1000
vim.opt.startofline = true                -- move cursor to start of line for ^F, ^B, etc.
vim.opt.timeoutlen = 500

vim.opt.scrolloff = 3                     -- pad a few lines after cursor
vim.opt.laststatus = 2                    -- always display status bar 
vim.opt.modelines = 0

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.wrap = false
vim.opt.showbreak= '↪'                    -- prepend to wrapped lines

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.ruler = true
vim.opt.number = true
vim.opt.numberwidth = 5 
vim.opt.relativenumber = true
vim.opt.showcmd = true

vim.opt.showmatch  = true 
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.termguicolors = true

vim.cmd([[
  au FileType python set ts=4 sw=4
]])

vim.opt.background = 'dark'
vim.cmd.colorscheme "catppuccin-frappe"

