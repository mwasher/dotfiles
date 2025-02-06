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

nmap_key('<C-j>', '<C-w>j')                       -- simplified pane swapping
nmap_key('<C-k>', '<C-w>k')
nmap_key('<C-h>', '<C-w>h')
nmap_key('<C-l>', '<C-w>l')

nmap_key('<C-u>', '<C-u>zz')                      -- center on cursor when scrolling
nmap_key('<C-d>', '<C-d>zz')

nmap_key('vv', '<C-w>v')                          -- simplified splitting
nmap_key('ss', '<C-w>s')

nmap_key('hhh', '<C-w><')
nmap_key('lll', '<C-w>>')

vmap_key('<', '<gv')                              -- allow multiple block indenting
vmap_key('>', '>gv')

xmap_key('p', 'P')                                -- keep copy register the same when pasting

nmap_key('<leader>h', '<CMD>noh<CR>')             -- clear search higights
nmap_key('<leader>w', '<CMD>set wrap!<CR>')       -- toggle linewrap

nmap_key('<C-o>', '<CMD>tabnew<CR>')              -- tabs controls
nmap_key('<C-p>', '<CMD>tabnext<CR>')
nmap_key('<C-i>', '<CMD>tabprev<CR>')

-- file searching/browsing
nmap_key('<leader>tr', '<CMD>NvimTreeToggle<CR>')
nmap_key('<leader>tf', '<CMD>Telescope find_files hidden=true<CR>')
nmap_key('<leader>tg', '<CMD>Telescope live_grep<CR>')
nmap_key('<leader>tb', '<CMD>Telescope buffers<CR>')
nmap_key('<leader>th', '<CMD>Telescope help_tags<CR>')
nmap_key('<leader>to', '<CMD>Telescope file_browser<CR>')
