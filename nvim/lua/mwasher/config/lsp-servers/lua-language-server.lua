return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".luarc.json",
		".git",
	},
	settings = {
		Lua = {
			telemetry = {
				enabled = false,
			},
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}
