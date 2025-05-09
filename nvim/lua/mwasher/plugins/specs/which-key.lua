-- Keymap tracker and pop-up showing possible keys
-- https://github.com/folke/which-key.nvim

return {
	"folke/which-key.nvim",
	event = "VeryLazy",

	opts = {
		preset = "classic",
		icons = {
			mappings = true,
		},
		spec = {
			{ "<leader>s", group = "[S]nacks" },
			{ "<leader>sf", group = "[S]nacks [F]ind" },
			{ "<leader>sg", group = "[S]nacks [G]it" },
			{ "<leader>u", group = "Snacks [U]ser Toggles" },
		},
	},
}
