-- Lightweight auto-formatter
-- https://github.com/stevearc/conform.nvim

vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

local formatters = {
	lua = { "stylua" },
	go = { "gofumpt" },
}

require("conform").setup({
	formatters_by_ft = formatters,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format(
			{ bufnr = args.buf, timeout_ms = 500, lsp_format = "failback" },
			function(err, did_edit)
				if not err and did_edit then
					vim.notify("Code formatted successfully", vim.log.levels.INFO, { title = "Conform" })
				end
			end
		)
	end,
})

vim.keymap.set({ "n", "v" }, "<leader>cf", function()
	require("conform").format({ async = true }, function(err, did_edit)
		if not err and did_edit then
			vim.notify("Code formatted successfully", vim.log.levels.INFO, { title = "Conform" })
		end
	end)
end, { desc = "Format buffer" })
