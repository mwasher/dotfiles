local servers = {
	"lua-language-server",
	"basedpyright",
	"gopls",
}

vim.diagnostic.config({
	severity_sort = true,
	float = {
		border = "rounded",
		focusable = true,
		source = "always",
		prefix = "",
		header = "",
	},
	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = vim.g.have_nerd_font and {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	} or {},
	virtual_text = false,
})

vim.lsp.enable(servers)
