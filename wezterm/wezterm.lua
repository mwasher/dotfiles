local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
  automatically_reload_config  = true,
  enable_tab_bar = false,
  window_decorations = "RESIZE",
  font = wezterm.font("FiraCode Nerd Font", {weight=450, stretch="Normal", style="Normal"}),
  font_size = 12
}

return config
