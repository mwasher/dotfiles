local plugin = {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000
}

function plugin.config()
  vim.cmd.colorscheme 'catppuccin-frappe'
end

return plugin

