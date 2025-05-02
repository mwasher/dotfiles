-- Picker and other assorted finders
-- https://github.com/folke/snacks.nvim

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,

	opts = {
		picker = {
			layout = {
				preset = "ivy",
			},
			sources = {
				explorer = {
					layout = { layout = { position = "right" } },
				},
			},
		},
		notifier = {
			enabled = true,
			timeout = 5000,
			style = "fancy",
			icons = {
				error = " ",
				warn = " ",
				info = " ",
				debug = " ",
				trace = " ",
			},
		},
		scroll = {
			enabled = true,
			animate = {
				duration = 5,
				easing = "inOutQuad",
				fps = 60,
			},
		},
		dashboard = {
			enabled = true,
			sections = {
				{ section = "header" },
				{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
				{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{
					icon = " ",
					title = "Git Status",
					section = "terminal",
					enabled = function()
						return Snacks.git.get_root() ~= nil
					end,
					cmd = "git status --short --branch --renames",
					indent = 2,
					padding = 1,
					height = 5,
					ttl = 5 * 60,
				},
				{ section = "startup" },
			},
		},
	},

	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Setup some globals for debugging (lazy-loaded)
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end
				vim.print = _G.dd -- Override print to use snacks for `:=` command

				-- Toggles
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
				Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
				Snacks.toggle.line_number():map("<leader>ul")
				Snacks.toggle.diagnostics():map("<leader>ud")
				Snacks.toggle.treesitter():map("<leader>uT")
				Snacks.toggle.inlay_hints():map("<leader>uh")
				Snacks.toggle.indent():map("<leader>ug")
				Snacks.toggle.dim():map("<leader>uD")
			end,

			vim.keymap.set("n", "<leader>t", function()
				Snacks.terminal.toggle()
			end, { desc = "Snacks: Terminal" }),

			vim.keymap.set("n", "<leader>bd", function()
				Snacks.bufdelete()
			end, { desc = "Snacks: Close buffer" }),
		})
	end,

	keys = {
		-- Pickers
		{
			"<leader>s<space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>s,",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>s/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>s:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>sn",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notifications",
		},
		{
			"<leader>se",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},

		-- Grep
		{
			"<leader>sb",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			"<leader>sB",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "Grep Open Buffers",
		},
		{
			"<leader>sw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Grep Selection or Word",
			mode = { "n", "x" },
		},

		-- Finds
		{
			"<leader>sfc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Neovim Configs",
		},
		{
			"<leader>sff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>sfg",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Find Git Files",
		},
		{
			"<leader>sfr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},

		-- Search
		{
			'<leader>s"',
			function()
				Snacks.picker.registers()
			end,
			desc = "Registers",
		},
		{
			"<leader>sa",
			function()
				Snacks.picker.autocmds()
			end,
			desc = "Autocmds",
		},
		{
			"<leader>sc",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>sC",
			function()
				Snacks.picker.commands()
			end,
			desc = "Commands",
		},

		{
			"<leader>sh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>sH",
			function()
				Snacks.picker.highlights()
			end,
			desc = "Highlights",
		},
		{
			"<leader>si",
			function()
				Snacks.picker.icons()
			end,
			desc = "Icons",
		},
		{
			"<leader>sj",
			function()
				Snacks.picker.jumps()
			end,
			desc = "Jumps",
		},
		{
			"<leader>sk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>sl",
			function()
				Snacks.picker.loclist()
			end,
			desc = "Location List",
		},
		{
			"<leader>sm",
			function()
				Snacks.picker.marks()
			end,
			desc = "Marks",
		},
		{
			"<leader>sM",
			function()
				Snacks.picker.man()
			end,
			desc = "Man Pages",
		},
		{
			"<leader>sp",
			function()
				Snacks.picker.lazy()
			end,
			desc = "Search for Plugin Spec",
		},
		{
			"<leader>sq",
			function()
				Snacks.picker.qflist()
			end,
			desc = "Quickfix List",
		},
		{
			"<leader>sR",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume",
		},
		{
			"<leader>su",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undo History",
		},

		-- LSP / diagnostics
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Snacks: Goto Definition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Snacks: Goto Declaration",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "Snacks: References",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Snacks: Goto Implementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Snacks: Goto Type Definition",
		},
		{
			"<leader>ss",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>sS",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "LSP Workspace Symbols",
		},
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>sD",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer Diagnostics",
		},

		-- Git
		{
			"<leader>sgb",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "Git Branches",
		},
		{
			"<leader>sgl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "it Log",
		},
		{
			"<leader>sgL",
			function()
				Snacks.picker.git_log_line()
			end,
			desc = "Git Log Line",
		},
		{
			"<leader>sgs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
		{
			"<leader>sgS",
			function()
				Snacks.picker.git_stash()
			end,
			desc = "Git Stash",
		},
		{
			"<leader>sgd",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Git Diff (Hunks)",
		},
		{
			"<leader>sgf",
			function()
				Snacks.picker.git_log_file()
			end,
			desc = "Git Log File",
		},

		-- Other neat things
		{
			"<leader>z",
			function()
				Snacks.zen.zoom()
			end,
			desc = "Snacks: Toggle [Z]oom",
		},
	},
}
