-- Run defined commands in persistent floating windows
-- https://github.com/salkhalil/summon.nvim

vim.pack.add({ "https://github.com/salkhalil/summon.nvim" })

require("summon").setup({
  width = 0.85,
  height = 0.85,
  border = "rounded",
  close_keymap = "<Esc><Esc>",
  highlights = {
    float = { bg = "none" },
    border = { fg = "#1bfd9c", bg = "none" },
    title = { fg = "#1bfd9c", bg = "none" },
  },
  commands = {
    terminal = {
      type = "terminal",
      command = "zsh",
      title = " zsh ",
      keymap = "<leader>z",
    },
    notes = {
      type = "file",
      command = "~/Documents/notes.txt",
      title = "Notes",
    },
  },
})
