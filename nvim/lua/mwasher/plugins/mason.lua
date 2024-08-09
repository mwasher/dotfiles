local plugin = {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim',

  }
}

function plugin.config()
  require('mason').setup()

  require('mason-lspconfig').setup({
    ensure_installed = {
      'lua_ls',
      'jsonls',
      'bashls',
      'pyright',
    }
  })
end

return plugin

