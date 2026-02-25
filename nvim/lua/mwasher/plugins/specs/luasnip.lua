-- Luasnip snippet engine
-- https://github.com/L3MON4D3/LuaSnip

return {
	"L3MON4D3/LuaSnip",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "v2.*",

	init = function()
		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}
