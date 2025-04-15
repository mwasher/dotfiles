-- Setup clipboard to work properly when using remote nvim
if os.getenv("SSH_TTY") == nil then
    vim.opt.clipboard:append("unnamedplus")
else
    vim.opt.clipboard:append("unnamedplus")

    local function paste(reg)
        return function()
            local content = vim.fn.getreg('"')
            return vim.split(content, "\n")
        end
    end

    vim.g.clipboard = {
        name = "OSC 52",
        copy = {
            ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
            ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
        },
        paste = {
            ["+"] = paste("+"),
            ["*"] = paste("*"),
        },
    }
end

require('mwasher.settings')
require('mwasher.mappings')

-- build plugin array and then load lazy plugin manager
LAZY_PLUGINS = {}

local function load_plugin(item)
  table.insert(LAZY_PLUGINS, { import = item })
end

if vim.g.vscode then
  load_plugin('mwasher.plugins.comment')
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
  load_plugin('mwasher.plugins.nvim-cmp')
  load_plugin('mwasher.plugins.none-ls')
  load_plugin('mwasher.plugins.mason-null-ls')
  load_plugin('mwasher.plugins.neoscroll')
end

require('mwasher.lazy')

