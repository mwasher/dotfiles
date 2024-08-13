local plugin = {
  'numToStr/Comment.nvim',
}

function plugin.config()
  require('Comment').setup()
end

return plugin

