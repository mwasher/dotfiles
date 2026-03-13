-- Animate and smear the cursor for easier visibility
-- https://github.com/sphamba/smear-cursor.nvim

vim.pack.add({ "https://github.com/sphamba/smear-cursor.nvim" })

require("smear_cursor").setup({
  cursor_color = "#1bfd9c",
  smear_between_neighbor_lines = true,
})
