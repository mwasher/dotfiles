local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
  automatically_reload_config  = true,
  enable_tab_bar = false,
  window_decorations = "RESIZE",
  color_scheme = "Catppuccin Frappe",
  colors = {
    background = '#292c3c',
  },
  font = wezterm.font("FiraCode Nerd Font", { weight=450, stretch="Normal", style="Normal" }),
  font_size = 12,
  window_padding = {
    left = 15,
    right = 0,
    top = 15,
    bottom = 10,
  }
}

return config
