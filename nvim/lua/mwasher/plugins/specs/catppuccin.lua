-- Catppuccin colorscheme
-- https://github.com/AlexvZyl/nordic.nvim

return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	opts = {
		transparent_background = true,
		no_bold = true,
		no_underline = true,
		integrations = {
			blink_cmp = true,
			snacks = { enabled = true },
			which_key = true,
			noice = true,
			mason = true,
		},
	},

	init = function()
		vim.cmd.colorscheme("catppuccin-macchiato")
	end,
}
