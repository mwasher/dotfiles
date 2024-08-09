require('mwasher.settings')
require('mwasher.mappings')

LAZY_PLUGIN_SPEC = {}

local function load_plugin(item)
  table.insert(LAZY_PLUGIN_SPEC, { import = item })
end

load_plugin('mwasher.plugins.colorscheme')
load_plugin('mwasher.plugins.plenary')
load_plugin('mwasher.plugins.nvim-web-devicons')
load_plugin('mwasher.plugins.telescope')
load_plugin('mwasher.plugins.telescope-file-browser')
load_plugin('mwasher.plugins.lualine')
load_plugin('mwasher.plugins.luatab')
load_plugin('mwasher.plugins.treesitter')
load_plugin('mwasher.plugins.mason')
load_plugin('mwasher.plugins.lspconfig')
load_plugin('mwasher.plugins.cmp')
require('mwasher.lazy')

