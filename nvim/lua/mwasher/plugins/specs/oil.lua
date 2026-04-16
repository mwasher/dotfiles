-- Filesystem manager
-- https://github.com/stevearc/oil.nvim

vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

require("oil").setup({
  columns = {
    "size",
    "icon",
  },
  win_options = {
    relativenumber = false,
  },
  view_options = {
    show_hidden = true,
  },
  float = {
    max_width = 0.9,
    preview_split = "right",
  },
})

vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Oil" })
