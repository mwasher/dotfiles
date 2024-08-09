local plugin = {
  'nvim-tree/nvim-tree.lua',
}

function plugin.config()
  require('nvim-tree').setup({
    view = { 
      width = 30,
      adaptive_size = true,
      side = 'right',
    },
  })
end

return plugin

