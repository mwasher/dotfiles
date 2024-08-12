local plugin = {
  "nvimtools/none-ls.nvim",
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
  }
}

function plugin.config()
  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup {
    sources = {
      formatting.black,
      require('none-ls.diagnostics.flake8').with {
        extra_args = {
          '--max-line-length=120',
        }
      }
    },
  }
end

return plugin
