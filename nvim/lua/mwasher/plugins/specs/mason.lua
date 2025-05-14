-- Package manager for LSP, linters, etc.
-- https://github.com/williamboman/mason.nvim
-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim

local default_packages = {
	"lua-language-server",
	"stylua",
	"yaml-language-server",
	"basedpyright",
	"black",
	"gopls",
}

return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = default_packages,
			auto_update = true,
			run_on_start = true,
		},
	},
}
