-- Package manager for LSP, linters, etc.
-- https://github.com/williamboman/mason.nvim
-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim

local packages = {
	"bash-language-server",
	"lua-language-server",
	"stylua",
	-- "yaml-language-server",
	"basedpyright",
	"black",
	-- "gopls",
	-- "gofumpt",
}

return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = packages,
			auto_update = true,
			run_on_start = true,
		},
	},
}
