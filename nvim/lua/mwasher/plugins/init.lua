require("mwasher.plugins.lazy-bootstrap")

require("lazy").setup({
	require("mwasher.plugins.specs.mini"),
  require("mwasher.plugins.specs.snacks"),
	require("mwasher.plugins.specs.conform"),
  require("mwasher.plugins.specs.nvim-treesitter"),
	require("mwasher.plugins.specs.luasnip"),
	require("mwasher.plugins.specs.blink"),
	require("mwasher.plugins.specs.monoglow"),
	require("mwasher.plugins.specs.smear-cursor"),
  require("mwasher.plugins.specs.summon")
})
