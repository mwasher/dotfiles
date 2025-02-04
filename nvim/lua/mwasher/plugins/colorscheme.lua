local plugin = {
  'dgox16/oldworld.nvim',
  lazy = false,
  priority = 1000,
}

function plugin.config()
  require('oldworld').setup({
    variant = 'default',
  })

  vim.cmd.colorscheme 'oldworld'
end

return plugin

