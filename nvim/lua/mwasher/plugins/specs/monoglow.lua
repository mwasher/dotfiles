-- Monoglow colorscheme for neovim
-- https://github.com/wnkz/monoglow.nvim

return {
	"wnkz/monoglow.nvim",
	lazy = false,
	priority = 1000,
	opts = {},

	config = function()
		require("monoglow").setup({
			on_colors = function(colors)
				-- colors.glow = "#fd1b7c"
			end,

			on_highlights = function(hl, c)
        hl.CursorLineNr = { fg = c.glow }
				-- hl["@keyword"] = { fg = c.syntax.keyword, italic = true }
				-- hl.Comment = vim.tbl_extend("force", hl.Comment, { bold = true })
			end,
		})
	end,

	init = function()
		vim.cmd.colorscheme("monoglow")
	end,
}
