-- Filesystem manager
-- https://github.com/stevearc/oil.nvim

vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

require("oil").setup()

vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Oil" })
