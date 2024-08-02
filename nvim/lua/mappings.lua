function map_key(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap_key(shortcut, command)
  map_key('n', shortcut, command)
end

function imap_key(shortcut, command)
  map_key('i', shortcut, command)
end

function vmap_key(shortcut, command)
  map_key('v', shortcut, command)
end

imap_key('jk', '<ESC>')

nmap_key('<C-j>', '<C-w>j')
nmap_key('<C-k>', '<C-w>k')
nmap_key('<C-h>', '<C-w>h')
nmap_key('<C-l>', '<C-w>l')
nmap_key('<C-p>', '<C-w>p')

nmap_key('vv', '<C-w>v')                    -- easy window splitting
nmap_key('ss', '<C-w>s')

nmap_key('<leader>h', '<CMD>noh<CR>')

nmap_key('<leader>w', '<CMD>tabnew<CR>')
nmap_key('<leader>e', '<CMD>tabnext<CR>')
nmap_key('<leader>q', '<CMD>tabprev<CR>')

nmap_key('<leader>b', '<CMD>bnext<CR>')

nmap_key('<leader>tf', '<CMD>Telescope find_files hidden=true<CR>')
nmap_key('<leader>tg', '<CMD>Telescope live_grep<CR>')
nmap_key('<leader>tb', '<CMD>Telescope buffers<CR>')
nmap_key('<leader>th', '<CMD>Telescope help_tags<CR>')
nmap_key('<leader>to', '<CMD>Telescope file_browser<CR>')

vmap_key('<', '<gv')                         -- allow multiple indent/dedent of same block
vmap_key('>', '>gv')

