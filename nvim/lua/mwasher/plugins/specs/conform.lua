-- Lightweight auto-formatter
-- https://github.com/stevearc/conform.nvim

local formatters = {
	lua = { "stylua" },
	go = { "gofumpt" },
}

return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			desc = "Conform format",
		},
	},
	opts = {
		formatters_by_ft = formatters,
	},
}
