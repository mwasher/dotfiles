-- Collection of various small enhancements
-- https://github.com/echasnovski/mini.nvim

vim.pack.add({ "https://github.com/echasnovski/mini.nvim" })

require("mini.ai").setup({ n_lines = 100 })
require("mini.comment").setup()
require("mini.git").setup()
require("mini.icons").setup()
require("mini.move").setup({
  mappings = {
    up = "K",
    down = "J",
  },
})
require("mini.statusline").setup()
require("mini.surround").setup({ n_lines = 100 })
