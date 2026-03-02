-- Picker and other assorted enhancements
-- https://github.com/folke/snacks.nvim

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,

	opts = {
		indent = {
			indent = {
				enabled = false,
			},
			scope = {
				enabled = false,
			},
			chunk = {

				only_current = true,
				char = {
					corner_top = "┌",
					corner_bottom = "└",
					horizontal = "",
					vertical = "│",
					arrow = "",
				},
			},
			animate = {
				easing = "outQuad",
				duration = {
					step = 30,
					max = 300,
				},
			},
		},
		notifier = { enabled = true },
		picker = {
      layout = {
        preset = "ivy",
      },
			sources = {
				explorer = {
					layout = {
						layout = {
							position = "right",
						},
					},
				},
			},
		},
		scroll = {
			enabled = true,
			animate = {
				duration = { step = 15, total = 250 },
				easing = "inOutQuad",
				fps = 60,
			},
		},
	},

  -- stylua: ignore start
  keys = {
    { "<leader><space>",     function() Snacks.picker.smart() end,            desc = "Smart Find Files" },
    { "<leader>,",           function() Snacks.picker.buffers() end,          desc = "Buffers" },
    { "<leader>/",           function() Snacks.picker.grep() end,             desc = "Grep" },
    { "<leader>.",           function() Snacks.picker.lines() end,            desc = "Buffer Lines" },
    { "<leader>:",           function() Snacks.picker.command_history() end,  desc = "Command History" },
    { "<leader>e",           function() Snacks.explorer() end,                desc = "File Explorer" },

    { "<leader>bd",          function() Snacks.bufdelete() end,               desc = "Delete buffer" },

    { "<leader>sn",          function() Snacks.picker.notifications() end,    desc = "Notification History" },
    { "<leader>sH",          function() Snacks.picker.highlights() end,       desc = "Highlights" },
    { "<leader>sK",          function() Snacks.picker.keymaps() end,          desc = "Keymaps" },

    { "<leader>Z",           function() Snacks.zen.zoom() end,                desc = "Zoom Window" },
  },
	-- stylua: ignore end

	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Toggles
				Snacks.toggle.line_number():map("<leader>ul")
				Snacks.toggle.diagnostics():map("<leader>ud")
			end,
		})

		vim.api.nvim_create_autocmd("LspProgress", {
			callback = function(ev)
				local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
				vim.notify(vim.lsp.status(), "info", {
					id = "lsp_progress",
					title = "LSP Progress",
					opts = function(notif)
						notif.icon = ev.data.params.value.kind == "end" and " "
							or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
					end,
				})
			end,
		})
	end,
}
