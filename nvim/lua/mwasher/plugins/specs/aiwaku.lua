-- Integrate AI agent into Neovim pane
-- https://github.com/juhaku/aiwaku.nvim

vim.pack.add({ "https://github.com/juhaku/aiwaku.nvim" })

require("aiwaku").setup({
  cmd = { "devin" },
  terminal_keymaps = {
    ["<C-h>"] = { command = "<C-\\><C-n><C-w>h", description = "Focus left" },
    ["<C-l>"] = { command = "<C-\\><C-n><C-w>l", description = "Focus right" },
  },
})
