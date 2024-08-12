local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
  automatically_reload_config  = true,
  enable_tab_bar = true,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = false,
  hide_tab_bar_if_only_one_tab = true,
  window_decorations = "RESIZE",
  color_scheme = "Catppuccin Frappe",
  colors = {
    background = '#292c3c',
  },
  font = wezterm.font("JetBrainsMono Nerd Font", { weight=450, stretch="Normal", style="Normal" }),
  font_size = 12,
  window_padding = {
    left = 10,
    right = 0,
    top = 15,
    bottom = 5,
  }
}

return config
