local plugin = {
  "jay-babu/mason-null-ls.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  }
}

function plugin.config()
  require("mason-null-ls").setup({
    ensure_installed = {
      'mypy',
      'black',
    }
  })
end

return plugin
