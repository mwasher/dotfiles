-- Treesitter parser integration
-- https://github.com/nvim-treesitter/nvim-treesitter

vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

if is_nixos() then
	vim.opt.rtp:append("/home/mwasher/.local/share/nvim/site/pack/hm/start/nvim-treesitter-grammars")
else
	require("nvim-treesitter").install({
		"bash",
		"lua",
		"markdown",
		"python",
		"go",
		"c",
		"cpp",
		"c_sharp",
		"json",
		"html",
		"javascript",
		"css",
	})
end

if not is_nixos() then
	vim.api.nvim_create_autocmd("VimEnter", {
		callback = function()
			if not is_nixos() then
				vim.cmd("silent TSUpdate")
			end
		end,
	})
end

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})
