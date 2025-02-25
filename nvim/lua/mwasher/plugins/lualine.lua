local virtual_env = function()
  if vim.bo.filetype ~= 'python' then
    return ""
  end

  -- local venv_path = os.getenv('VIRTUAL_ENV')
  local venv = tostring(os.getenv('VIRTUAL_ENV_PROMPT'))
  -- local venv_name = vim.fn.fnamemodify(venv_path, ':t')
  return string.format("%s", venv)
end

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
      lualine_x = { 'encoding', 'filetype', virtual_env },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
  })
end

return plugin

