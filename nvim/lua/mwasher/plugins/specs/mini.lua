-- Collection of various small enhancements
-- https://github.com/echasnovski/mini.nvim

return {
	"echasnovski/mini.nvim",
	version = false,

	config = function()
		--  Improve 'a' and 'i' text object functionality
		require("mini.ai").setup({ n_lines = 100 })

		-- Delete, replace, find surroundings (sa, sd, sr, sf)
		require("mini.surround").setup({ n_lines = 100 })

		-- Smarter commenting with text object (gc)
		require("mini.comment").setup()

		-- Bracket pairing
		require("mini.pairs").setup()

		-- Move text blocks in visual mode
		require("mini.move").setup({
			mappings = {
				up = "K",
				down = "J",
			},
		})
	end,
}
