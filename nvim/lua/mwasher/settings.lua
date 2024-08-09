vim.opt.encoding = 'utf-8'
vim.opt.backspace = 'indent,eol,start'    -- backspace deletes tabs when expandtab true
vim.opt.history = 1000
vim.opt.startofline = true                -- move cursor to start of line for ^F, ^B, etc.

vim.opt.scrolloff = 3                     -- pad a few lines after cursor
vim.opt.laststatus = 2                    -- always display status bar 
vim.opt.modelines = 0                     -- do not inspect file for vim options
vim.opt.timeoutlen = 500                  -- longer delay for multikey mappings

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.wrap = false
vim.opt.showbreak= '↪'                    -- prepend to wrapped lines

vim.opt.splitbelow = true                 -- force all splits right and down
vim.opt.splitright = true

vim.opt.ruler = true
vim.opt.number = true
vim.opt.numberwidth = 4 
vim.opt.relativenumber = true
vim.opt.cursorline = true                 -- set so we can highlight the current line num
vim.opt.cursorlineopt = 'number'

vim.opt.signcolumn = 'yes'
vim.opt.showcmd = true                    -- always show command bar at the bottom
vim.opt.showmode = false                  -- do not need mode with lua-line plugin

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

vim.opt.pumblend = 10
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = "grey", bold=true }) -- highlight cur. line num

