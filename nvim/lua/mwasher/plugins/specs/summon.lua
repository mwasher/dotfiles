-- Run defined commands in persistent floating windows
-- https://github.com/salkhalil/summon.nvim

return {
	"salkhalil/summon.nvim",
	opt = {},

	config = function()
		require("summon").setup({
			width = 0.85,
			height = 0.85,
			border = "rounded",
			close_keymap = "<Esc><Esc>",
			highlights = {
				float = { bg = "#121212" },
				border = { fg = "#2a2a2a", bg = "#121212" },
				title = { fg = "#1bfd9c", bg = "#121212", bold = true },
			},
			commands = {
				terminal = {
					type = "terminal",
					command = "zsh",
					title = "zsh",
					keymap = "<leader>z",
				},
				notes = {
					type = "file",
					command = "~/Documents/notes.txt",
					title = "Notes",
				},
			},
		})
	end,
}
