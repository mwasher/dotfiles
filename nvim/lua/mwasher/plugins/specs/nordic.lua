-- Nordic colorscheme
-- https://github.com/AlexvZyl/nordic.nvim

return {
	"AlexvZyl/nordic.nvim",
	lazy = false,
	priority = 1000,

	opts = {
		italic_comments = false,
		transparent = {
			bg = true,
		},
		cursorline = {
			bold_number = true,
			theme = "light",
		},
		noice = {
			-- classsic / flat
			style = "classic",
		},
		telescope = {
			--  classic /flat
			style = "classic",
		},
		ts_context = {
			dark_background = true,
		},
	},

	init = function()
		vim.cmd.colorscheme("nordic")
		vim.api.nvim_set_hl(0, "Comment", { fg = "#60728a" })
		vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
		vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#3b4252" })
	end,
}
