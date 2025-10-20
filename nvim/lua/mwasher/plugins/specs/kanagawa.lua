-- Kanagawa colorscheme
-- https://github.com/rebelot/kanagawa.nvim

return {
	"rebelot/kanagawa.nvim",
	version = false,
	lazy = false,
	priority = 1000,

	config = function()
		require("kanagawa").setup({
			compile = false,
			undercurl = true,
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = false },
			statementStyle = { bold = false },
			typeStyle = {},
			transparent = true,
			dimInactive = false,
			terminalColors = true,
			colors = {
				palette = {},
				-- theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
				theme = {
					dragon = {
						ui = {
							bg_gutter = "none",
						},
					},
				},
			},
			overrides = function(colors) -- add/modify highlights
				local theme = colors.theme
				return {
					Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
					PmenuSel = { fg = "none", bg = theme.ui.bg_p2 },
					PmenuSbar = { bg = theme.ui.bg_m1 },
					PmenuThumb = { bg = theme.ui.bg_p2 },
					BlinkCmpMenuBorder = { fg = "none", bg = "none" },
					NoiceCmdlinePopup = { bg = theme.ui.bg_p1 },
					NormalFloat = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
					FloatBorder = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
					FloatTitle = { bg = "none" },
					CursorLine = { bg = theme.ui.bg_p1 },
				}
			end,
			theme = "dragon",
			background = {
				dark = "dragon",
				light = "lotus",
			},
		})
	end,

	init = function()
		vim.cmd.colorscheme("kanagawa")
	end,
}
