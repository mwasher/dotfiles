-- Integrate AI agent into Neovim pane
-- https://github.com/juhaku/aiwaku.nvim

vim.pack.add({ "https://github.com/juhaku/aiwaku.nvim" })

require("aiwaku").setup({
  cmd = { "devin" },
})
