local wezterm = require("wezterm")

local config = wezterm.config_builder()

local act = wezterm.action

config = {
  automatically_reload_config  = true,

  color_scheme = "Catppuccin Frappe",

  font = wezterm.font("MesloLGS Nerd Font Mono"),
  font_size = 12,

  window_decorations = "RESIZE",
  window_padding = {
    left = 10,
    right = 0,
    top = 5,
    bottom = 5,
  },

  adjust_window_size_when_changing_font_size = false,

  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  tab_max_width = 30,

  colors = {
    tab_bar = {
      background = '#202020',
    },
  },

  leader = { key = 'Space', mods = 'ALT', timeout_milliseconds = 500 },

  keys = {
    { key = 'n', mods = 'ALT', action = act.ShowLauncher, },
    { key = 'v', mods = 'ALT|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
    { key = 's', mods = 'ALT|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
    { key = 'h', mods = 'ALT', action = act.ActivatePaneDirection 'Left', },
    { key = 'l', mods = 'ALT', action = act.ActivatePaneDirection 'Right', },
    { key = 'k', mods = 'ALT', action = act.ActivatePaneDirection 'Up', },
    { key = 'j', mods = 'ALT', action = act.ActivatePaneDirection 'Down', },
    { key = 'H', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Left', 5 }, },
    { key = 'J', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Down', 5 }, },
    { key = 'K', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Up', 5 } },
    { key = 'L', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Right', 5 }, },
    { key = 'Z', mods = 'ALT|SHIFT', action = wezterm.action.TogglePaneZoomState, },
  },
}

return config
