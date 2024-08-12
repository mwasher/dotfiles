local plugin = {
  'nvim-tree/nvim-tree.lua',
}

function plugin.config()
  local icons = require "mwasher.icons"

  require('nvim-tree').setup({
    view = { 
      width = 30,
      adaptive_size = true,
      side = 'right',
    },
  })
end

return plugin

