-- Treesitter parser integration
-- https://github.com/nvim-treesitter/nvim-treesitter

vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

if is_nixos() then
	vim.opt.rtp:append("/home/mwasher/.local/share/nvim/site/pack/hm/start/nvim-treesitter-grammars")
end

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})
