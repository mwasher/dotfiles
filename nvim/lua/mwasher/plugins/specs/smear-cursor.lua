-- Animate and smear the cursor for easier visibility
-- https://github.com/sphamba/smear-cursor.nvim

return {
	"sphamba/smear-cursor.nvim",
	event = "VeryLazy",

	opts = {
		cursor_color = "#bf616a",

		stiffness = 0.8,
		trailing_stiffness = 0.49,
		distance_stop_animating = 0.5,
		never_draw_over_target = false,
	},
}
