-- Lightweight auto-formatter
-- https://github.com/stevearc/conform.nvim

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format({ timeout_ms = 1000, async = true, lsp_fallback = true })
			end,
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			go = { "gofump" },
		},
		format_on_save = function(bufnr)
			local function formatCallback(err)
				if err then
					vim.notify("Error during formatting: ", err)
				else
					vim.notify("Formatting completed.")
				end
			end

			local disable_filetypes = {}
			if disable_filetypes[vim.bo[bufnr].filetype] then
				return nil
			else
				return {
					timeout_ms = 1000,
					lsp_fallback = true,
				}, formatCallback()
			end
		end,
	},
}
