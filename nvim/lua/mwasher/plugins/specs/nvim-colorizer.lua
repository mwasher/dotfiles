-- Show color for color codes in the document
-- https://github.com/norcalli/nvim-colorizer.lua

return {
	"norcalli/nvim-colorizer.lua",

	config = function()
		require("colorizer").setup({
			"*",
		}, { mode = "background", names = false })
	end,
}
