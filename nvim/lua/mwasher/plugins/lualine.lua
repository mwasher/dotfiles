local plugin = {
  'nvim-lualine/lualine.nvim',
}

function plugin.config()
  require('lualine').setup({
    options = {
      section_separators = '', component_separators = '|',
      ignore_focus = { 'NvimTree' },
    },
    sections = {
      lualine_a = { 'filename' },
      lualine_b = { 'branch' },
      lualine_c = { 'diff', 'diagnostics' },
      lualine_x = { 'encoding', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
  })
end

return plugin

