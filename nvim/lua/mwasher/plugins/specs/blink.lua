-- Blink completions engine
-- https://github.com/Saghen/blink.cmp

vim.pack.add({
  {
    src = "https://github.com/Saghen/blink.cmp",
    version = vim.version.range("*"),
  }
})

require("blink.cmp").setup({
  appearance = {
    nerd_font_variant = "normal",
  },

  completion = {
    menu = {
      draw = {
        treesitter = { "lsp" },
        columns = {
          { "kind_icon" },
          { "label", "label_description", "source_name", gap = 5 },
        },
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 500,
    },
  },

  fuzzy = { implementation = "prefer_rust_with_warning" },

  keymap = {
    preset = "default",
  },

  snippets = {
    preset = "luasnip",
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
})
