-- Picker and other assorted enhancements
-- https://github.com/folke/snacks.nvim

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,

	opts = {
		indent = {
			indent = {
				enabled = false,
			},
			scope = {
				enabled = false,
			},
			chunk = {
				enabled = true,
				only_current = true,
				char = {
					corner_top = "┌",
					corner_bottom = "└",
					horizontal = "",
					vertical = "│",
					arrow = "",
				},
			},
			animate = {
				easing = "outQuad",
				duration = {
					step = 30,
				},
			},
		},
	},

	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Setup some globals for debugging (lazy-loaded)
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end
				vim.print = _G.dd -- Override print to use snacks for `:=` command

				-- Toggle examples
				Snacks.toggle.line_number():map("<leader>ul")
				Snacks.toggle.diagnostics():map("<leader>ud")
			end,

			vim.keymap.set("n", "<leader>bd", function()
				Snacks.bufdelete()
			end, { desc = "Snacks: Close buffer" }),
		})
	end,
}
