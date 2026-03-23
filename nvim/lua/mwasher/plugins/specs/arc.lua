-- Improved jumping within the document
-- https://codeberg.org/knight9114/arc.nvim

vim.pack.add({ "https://codeberg.org/knight9114/arc.nvim" })

require("arc").setup({
	keymap = false,
	hl_label = "Operator",
})

vim.keymap.set({ "n", "x", "o" }, "<leader>f", require("arc").jump, { desc = "Arc Jump" })
