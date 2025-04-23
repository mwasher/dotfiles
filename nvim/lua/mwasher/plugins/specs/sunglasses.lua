-- Shading of inactive panes
-- https://github.com/miversen33/sunglasses.nvim

return {
	"miversen33/sunglasses.nvim",
	event = "UiEnter",
	config = true,

	opts = {
		filter_type = "SHADE",
		filter_percent = 0.20,
	},
}
