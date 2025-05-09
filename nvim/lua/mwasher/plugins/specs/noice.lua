-- Command line replacement primarily
-- https://github.com/AlexvZyl/nordic.nvim

return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {
		presets = {
			bottom_search = true,
			command_palette = false,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = true,
		},
		cmdline = { enabled = true },
		popupmenu = { enabled = true },
		messages = { enabled = false },
		notify = { enbabled = false },
	},
}
