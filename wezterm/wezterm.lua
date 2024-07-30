local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
  automatically_reload_config  = true,
  enable_tab_bar = false,
  window_decorations = "RESIZE",
  color_scheme = 'Everforest Dark (Gogh)',
  color_scheme = "Catppuccin Frappe",
  font = wezterm.font("FiraCode Nerd Font", {weight=450, stretch="Normal", style="Normal"}),
  font_size = 12
}

return config
