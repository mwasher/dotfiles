local plugin = {
  'linux-cultist/venv-selector.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-telescope/telescope.nvim',
    'mfussenegger/nvim-dap-python',
  },
  keys = {
    { '<leader>vs', '<cmd>VenvSelect<cr>' },
    { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
  },
}

function plugin.config()
  require('venv-selector').setup()
end

return plugin

