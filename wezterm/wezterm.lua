local wezterm = require("wezterm")

local myFont = "JetBrainsMono Nerd Font"

local act = wezterm.action

function tab_title(tab_info)
	local title = tab_info.tab_title

	if title and #title > 0 then
		return title
	end

	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab_title(tab)
	if tab.is_active then
		return {
			{ Background = { Color = "#333c43" } },
			{ Text = " " .. title .. " " },
		}
	else
		return {
			{ Background = { Color = "#333c43" } },
			{ Text = " " .. title .. " " },
		}
	end
	return title
end)

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.automatically_reload_config = true
config.adjust_window_size_when_changing_font_size = false

config.audible_bell = "Disabled"

config.font = wezterm.font(myFont)
config.font_size = 12

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = true

config.window_decorations = "RESIZE"

config.window_padding = {
	left = 3,
	right = 0,
	top = 3,
	bottom = 0,
}

config.window_frame = {
	font = wezterm.font({ family = myFont, weight = "Bold" }),
	font_size = 10,

	active_titlebar_bg = "#333c43",
	inactive_titlebar_bg = "#333c43",
}

config.leader = { key = "a", mods = "ALT", timeout_milliseconds = 500 }

config.keys = {
	{ key = "n", mods = "ALT", action = act.ShowLauncher },
	{ key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
	{ key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
	{ key = "v", mods = "ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "s", mods = "ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "ALT", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "ALT", action = act.ActivatePaneDirection("Right") },
	{ key = "k", mods = "ALT", action = act.ActivatePaneDirection("Up") },
	{ key = "j", mods = "ALT", action = act.ActivatePaneDirection("Down") },
	{ key = "H", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "J", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "K", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "L", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },
	{ key = "z", mods = "ALT", action = wezterm.action.TogglePaneZoomState },
	{ key = "f", mods = "ALT", action = wezterm.action.ToggleFullScreen },
}

config.color_scheme = "Everforest Dark Soft (Gogh)"

return config
