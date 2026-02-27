-- Blink completions engine
-- https://github.com/Saghen/blink.cmp

return {
	"saghen/blink.cmp",
	event = "VeryLazy",
	depdendencies = {},
	version = "1.*",

	opts = {
		appearance = {
			nerd_font_variant = "normal",
		},

		completion = {
			menu = {
				draw = {
					treesitter = { "lsp" },
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", "source_name", gap = 5 },
					},
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
			},
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },

		keymap = {
			preset = "default",
		},

		snippets = {
			preset = "luasnip",
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},

	opts_extend = { "sources.default" },
}
