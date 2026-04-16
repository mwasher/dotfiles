-- LSP injections for diags, code actions
-- https://github.com/nvimtools/none-ls.nvim

vim.pack.add({ "https://github.com/nvimtools/none-ls.nvim" })

require("null-ls").setup({
  sources = {
    require("aiwaku.lsp-code-actions"),
  },
})
