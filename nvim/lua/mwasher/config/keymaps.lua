-- Leader mapping
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Mappings for normal mode
local n_mappings = {
	{ "<Esc>", ":nohlsearch<CR>", "Remove search highlight", silent = true },
	{ "<C-h>", "<C-w><C-h>", "Move focus to the left pane" },
	{ "<C-l>", "<C-w><C-l>", "Move focus to the right pane" },
	{ "<C-j>", "<C-w><C-j>", "Move focus to the lower pane" },
	{ "<C-k>", "<C-w><C-k>", "Move focus to the upper pane" },
	{ "<C-u>", "<C-u>zz", "Center on cursor on ^u" },
	{ "<C-d>", "<C-d>zz", "Center on cursor on ^d" },
	{ "n", "nzzzv", "Next search item centered" },
	{ "N", "Nzzzv", "Previous search item centered" },
	{ "<C-i>", ":bp<CR>", "Previous buffer", silent = true },
	{ "<C-p>", ":bn<CR>", "Next buffer", silent = true },
	{ "<leader>o", ":tabnew<CR>", "New tab", silent = true },
	{ "<leader>i", ":tabprev<CR>", "Previous tab", silent = true },
	{ "<leader>p", ":tabnext<CR>", "Next tab", silent = true },
	{ "<leader>q", vim.diagnostic.setloclist, "Diagnostic [Q]uickfix list" },
}

-- Mappings for insert mode
local i_mappings = {
	{ "jk", "<Esc>", "Exit insert mode" },
}

-- Mappings for visual mode
local x_mappings = {
	{ "p", '"_dp', "Paste" }, -- keeping register contents the same when overwriting text
}

-- Mappings for select mode
local s_mappings = {}

-- Mappings for visual + select mode
local v_mappings = {
	{ "<", "<gv", "Indent" }, -- allow multiple block indents
	{ ">", ">gv", "Outdent" }, -- allow multiple block outdents
	-- text block movement managed by mini.move
}

-- Mappings for terminal
local t_mappings = {
	{ "<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode" },
}

-- Helper to loop through keymap tables and set
local function map_keys(mode, mappings)
	for _, mapping in ipairs(mappings) do
		vim.keymap.set(mode, mapping[1], mapping[2], { desc = mapping[3], silent = mapping["silent"] })
	end
end

map_keys("n", n_mappings)
map_keys("i", i_mappings)
map_keys("x", x_mappings)
map_keys("s", s_mappings)
map_keys("v", v_mappings)
map_keys("t", t_mappings)
