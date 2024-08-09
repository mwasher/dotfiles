local plugin = {
  'nvim-lualine/lualine.nvim'
}

function plugin.config()
  require('lualine').setup({
    options = {
      theme  = 'catppuccin',
    }
  })
end

return plugin

