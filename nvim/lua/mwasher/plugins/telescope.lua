local plugin = {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8'
}

function plugin.config()
  require('telescope').setup({
    defaults = {
      winblend = 15,
    }
  })
end

return plugin

