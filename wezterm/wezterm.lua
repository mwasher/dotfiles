local wezterm = require("wezterm")

local act = wezterm.action

local config = {
  automatically_reload_config  = true,
  adjust_window_size_when_changing_font_size = false,

  audible_bell = "Disabled",

  font = wezterm.font("Iosevka Nerd Font Mono"),
  font_size = 12,

  window_decorations = "RESIZE",
  window_padding = {
    left = 5,
    right = 0,
    top = 5,
    bottom = 0,
  },
  window_frame = {
    font = wezterm.font { family = 'Iosevka Nerd Font Mono', weight = 'Bold' },
    font_size = 10,
  },

  enable_tab_bar = false,
  hide_tab_bar_if_only_one_tab = false,
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = true,

  leader = { key = 'a', mods = 'ALT', timeout_milliseconds = 500 },

  keys = {
    { key = 'v', mods = 'CTRL', action = act.Nop, },
    { key = 'n', mods = 'ALT', action = act.ShowLauncher, },
    { key = 'c', mods = 'CTRL|SHIFT', action = wezterm.action.CopyTo('Clipboard'), },
    { key = 'v', mods = 'CTRL|SHIFT', action = wezterm.action.PasteFrom('Clipboard'), },
    { key = 'v', mods = 'ALT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
    { key = 's', mods = 'ALT', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
    { key = 'h', mods = 'ALT', action = act.ActivatePaneDirection 'Left', },
    { key = 'l', mods = 'ALT', action = act.ActivatePaneDirection 'Right', },
    { key = 'k', mods = 'ALT', action = act.ActivatePaneDirection 'Up', },
    { key = 'j', mods = 'ALT', action = act.ActivatePaneDirection 'Down', },
    { key = 'H', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Left', 5 }, },
    { key = 'J', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Down', 5 }, },
    { key = 'K', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Up', 5 }, },
    { key = 'L', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Right', 5 }, },
    { key = 'z', mods = 'LEADER', action = wezterm.action.TogglePaneZoomState, },
    { key = 'f', mods = 'LEADER', action = wezterm.action.ToggleFullScreen, },
  },

  color_scheme = 'oldworld oled',

  color_schemes = {
    ['oldworld'] = {
      background = '#161617',
      foreground = '#c9c7cd',
      cursor_bg = '#90b99f',
      cursor_fg = '#000000',
      cursor_border = '#90b99f',
      selection_fg = '161617',
      selection_bg = '#c9c7cd',
      split = '#444444',
      ansi = {
        '#27272a',
        '#ea83a5',
        '#90b99f',
        '#e6b99d',
        '#92a2d5',
        '#e29eca',
        '#85b5ba',
        '#c9c7cd',
      },
      brights = {
        '#353539',
        '#ed96b3',
        '#a7c8b3',
        '#eac5ae',
        '#a7b3dd',
        '#e8b0d4',
        '#97c0c4',
        '#ffffff',
      },
      tab_bar = {
        background = '#000000',
      },
    },
    ['oldworld oled'] = {
      background = '#000000',
      foreground = '#c9c7cd',
      cursor_bg = '#90b99f',
      cursor_fg = '#000000',
      cursor_border = '#90b99f',
      selection_fg = '161617',
      selection_bg = '#c9c7cd',
      split = '#444444',
      ansi = {
        '#161617',
        '#ea83a5',
        '#90b99f',
        '#e6b99d',
        '#92a2d5',
        '#e29eca',
        '#85b5ba',
        '#c9c7cd',
      },
      brights = {
        '#27272a',
        '#ed96b3',
        '#a7c8b3',
        '#eac5ae',
        '#a7b3dd',
        '#e8b0d4',
        '#97c0c4',
        '#ffffff',
      },
      tab_bar = {
        background = '#000000',
      },
    },
  },
}

return config

