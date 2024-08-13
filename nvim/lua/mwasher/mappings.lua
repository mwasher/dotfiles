local function map_key(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap_key(shortcut, command)
  map_key('n', shortcut, command)
end

local function imap_key(shortcut, command)
  map_key('i', shortcut, command)
end

local function vmap_key(shortcut, command)
  map_key('v', shortcut, command)
end

local function xmap_key(shortcut, command)
  map_key('x', shortcut, command)
end

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

imap_key('jk', '<ESC>')                           -- rebind normal mode escape

nmap_key('<M-j>', '<C-w>j')                       -- simplified pane swapping
nmap_key('<M-k>', '<C-w>k')
nmap_key('<M-h>', '<C-w>h')
nmap_key('<M-l>', '<C-w>l')

nmap_key('vv', '<C-w>v')                          -- simplified splitting
nmap_key('ss', '<C-w>s')

vmap_key('<', '<gv')                              -- allow multiple block indenting
vmap_key('>', '>gv')

xmap_key('p', 'P')                                -- keep copy register the same when pasting

nmap_key('<leader>h', '<CMD>noh<CR>')             -- clear search higights
nmap_key('<leader>w', '<CMD>set wrap!<CR>')       -- toggle linewrap

nmap_key('<M-o>', '<CMD>tabnew<CR>')              -- tabs controls
nmap_key('<M-p>', '<CMD>tabnext<CR>')
nmap_key('<M-i>', '<CMD>tabprev<CR>')

nmap_key('<leader>b', '<CMD>bnext<CR>')

-- file searching/browsing
nmap_key('<leader>tr', '<CMD>NvimTreeToggle<CR>')
nmap_key('<leader>tf', '<CMD>Telescope find_files hidden=true<CR>')
nmap_key('<leader>tg', '<CMD>Telescope live_grep<CR>')
nmap_key('<leader>tb', '<CMD>Telescope buffers<CR>')
nmap_key('<leader>th', '<CMD>Telescope help_tags<CR>')
nmap_key('<leader>to', '<CMD>Telescope file_browser<CR>')

-- lsp 
nmap_key('<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
nmap_key('<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
nmap_key('<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
nmap_key('<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>')
nmap_key('<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
nmap_key('<leader>K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
nmap_key('<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>')
nmap_key('<leader>lj', '<cmd>lua vim.diagnostic.goto_next()<cr>')
nmap_key('<leader>lk', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

