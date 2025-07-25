-- Everforest colorscheme
-- https://github.com/neanias/everforest-nvim

return {
	"neanias/everforest-nvim",
	version = false,
	lazy = false,
	priority = 1000,

	config = function()
		require("everforest").setup({
			background = "soft",
			transparent_background_level = 1.0,
			italics = false,
			disable_italic_comments = true,
			sign_column_background = "none",
			ui_contrast = "low",
			dim_inactive_windows = false,
			show_eob = false,
			diagnostic_text_highlight = false,
			diagnostic_virtual_text = "coloured",
			diagnostic_line_highlight = false,
			spell_foreground = false,
			inlay_hints_background = "none",
			float_style = "bright",

			on_highlights = function(hl, palette)
				hl.FloatBorder = hl.BlinkCmpMenuBorder
				hl.NormalFloat = { bg = "none" }
				hl.Pmenu = { bg = "none" }
				hl.CursorLine = { bg = palette.bg1 }
				hl.SnacksIndent = { fg = palette.bg_yellow, bg = "" }
				hl.SnacksIndentChunk = { fg = palette.bg_yellow, bg = "" }
			end,
		})
	end,

	init = function()
		vim.cmd.colorscheme("everforest")
	end,
}
