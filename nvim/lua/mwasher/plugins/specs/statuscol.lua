-- Add clickable status column and relative number in same column
-- https://github.com/luukvbaal/statuscol.nvim

vim.pack.add({ "https://github.com/luukvbaal/statuscol.nvim" })

require("statuscol").setup({
  relculright = true,
})
