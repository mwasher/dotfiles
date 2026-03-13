-- Monoglow colorscheme for neovim
-- https://github.com/wnkz/monoglow.nvim

-- fg 	  #cccccc
-- gray8 	#cccccc
-- gray7 	#aaaaaa
-- gray6 	#7a7a7a
-- gray5 	#555555
-- gray4 	#444444
-- glow 	#1bfd9c
-- lack 	#708090
-- luster #deeeed
-- blue1 	#b2d8d8
-- blue2 	#66b2b2

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
        hl.Normal = { bg = "none" }
        hl.SignColumn = { bg = "none" }
        hl.CursorLineNr = { fg = c.glow }
        hl.NormalFloat = { bg = "none" }
        hl.FloatTitle = { fg = c.glow, bg = "none" }
        hl.FloatBorder = { fg = c.glow, bg = "none" }
        hl.DiagnosticInfo = { fg = c.glow, bg = "none" }
        
        hl.MiniStatuslineModeNormal = { fg = c.glow, bg = c.gray2 }
        hl.MiniStatuslineModeInsert = { fg = c.gray1, bg = c.glow }
        hl.MiniStatuslineModeVisual = { fg = c.gray1, bg = c.lack }
        hl.MiniStatuslineFilename = { fg = c.gray6 }

        hl.SnacksIndentScope = { fg = c.glow }
			end,
		})
	end,

	init = function()
		vim.cmd.colorscheme("monoglow")
	end,
}
