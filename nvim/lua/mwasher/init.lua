require('mwasher.settings')
require('mwasher.mappings')

-- build plugin array and then load lazy plugin manager
LAZY_PLUGINS = {}

local function load_plugin(item)
  table.insert(LAZY_PLUGINS, { import = item })
end

if vim.g.vscode then

else
  load_plugin('mwasher.plugins.colorscheme')
  load_plugin('mwasher.plugins.plenary')
  load_plugin('mwasher.plugins.nvim-web-devicons')
  load_plugin('mwasher.plugins.telescope')
  load_plugin('mwasher.plugins.telescope-file-browser')
  load_plugin('mwasher.plugins.nvim-tree')
  load_plugin('mwasher.plugins.lualine')
  load_plugin('mwasher.plugins.luatab')
  load_plugin('mwasher.plugins.treesitter')
  load_plugin('mwasher.plugins.comment')
  load_plugin('mwasher.plugins.schemastore')
  load_plugin('mwasher.plugins.mason')
  load_plugin('mwasher.plugins.lspconfig')
  load_plugin('mwasher.plugins.cmp')
  load_plugin('mwasher.plugins.none-ls')
  load_plugin('mwasher.plugins.mason-null-ls')
end

require('mwasher.lazy')

