local plugin = {
  'nvim-treesitter/nvim-treesitter',
  event = { "BufReadPost", "BufNewFile" },
  build = ':TSUpdate',
}

function plugin.config()
  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'vim', 'bash', 'python', 'json' },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },  
  })
end

return plugin

