local plugin = {
  'nvim-lualine/lualine.nvim'
}

function plugin.config()
  require('lualine').setup({
    options = {
      theme  = 'catppuccin',
      disabled_filetypes = { 'NvimTree' },
    }
  })
end

return plugin

