return {
  settings = {
    Lua = {
      format = {
        enable = false,
      },
      diagnostics = {
        globals = { "vim", "load_plugin" },
      },
      runtime = {
        special = {
          load_plugin = "require",          -- allow 'gd' for plugins definitions
        },
      },
    },
  },
}
