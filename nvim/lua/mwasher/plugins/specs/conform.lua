-- Lightweight auto-formatter
-- https://github.com/stevearc/conform.nvim

return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      desc = "[F]ormat buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
    },
    format_on_save = function(bufnr)
      local disable_filetypes = {}
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = "fallback",
        }
      end
    end,
  },
}
