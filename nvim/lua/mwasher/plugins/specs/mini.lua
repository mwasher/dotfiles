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

		-- Icons
		require("mini.icons").setup()
	end,
}
