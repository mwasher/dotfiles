local plugin = {
  'alvarosevilla95/luatab.nvim'
}

function plugin.config()
  require('luatab').setup()
end

return plugin

