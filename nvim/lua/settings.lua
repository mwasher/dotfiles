HOME = os.getenv('HOME')

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

vim.cmd([[
  au FileType python set ts=4 sw=4
]])

vim.opt.background = 'dark'

function map_key(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap_key(shortcut, command)
  map_key('n', shortcut, command)
end

function imap_key(shortcut, command)
  map_key('i', shortcut, command)
end

imap_key('jk', '<ESC>') 

nmap_key('<C-j>', '<C-w>j')
nmap_key('<C-k>', '<C-w>k')
nmap_key('<C-h>', '<C-w>h')
nmap_key('<C-l>', '<C-w>l')
nmap_key('<C-p>', '<C-w>p')

nmap_key('<leader>h', '<CMD>noh<CR>')

nmap_key('<leader>w', '<CMD>tabnew<CR>')
nmap_key('<leader>e', '<CMD>tabnext<CR>')
nmap_key('<leader>q', '<CMD>tabprev<CR>')

nmap_key('<leader>b', '<CMD>bnext<CR>')

nmap_key('<leader>n', '<CMD>NERDTreeToggle<CR>')

nmap_key('<leader>tf', '<CMD>Telescope find_files hidden=true<CR>')
nmap_key('<leader>tg', '<CMD>Telescope live_grep<CR>')
nmap_key('<leader>tb', '<CMD>Telescope buffers<CR>')
nmap_key('<leader>th', '<CMD>Telescope help_tags<CR>')

vim.cmd.colorscheme "catppuccin-frappe"

