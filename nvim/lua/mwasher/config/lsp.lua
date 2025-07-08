-- Native LSP configuration for Neovim 0.11+

local servers = {
	"bash-language-server",
	"lua-language-server",
	"yaml-language-server",
	"basedpyright",
	"gopls",
}

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	},
	float = {
		style = "minimnal",
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
		suffix = "",
	},
	update_in_insert = true,
	severity_sort = true,
	underline = false,
	virtual_text = { severity = { min = vim.diagnostic.severity.WARN }, current_line = true },
	virtual_lines = false,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.semanticTokens.multilineTokenSupport = true
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config("*", {
	capabilities = capabilities,
})

for _, bind in ipairs({ "grn", "gra", "gri", "grr" }) do
	pcall(vim.keymap.del, "n", bind)
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		-- local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end

		client.server_capabilities.semanticTokensProvider = nil

		local keymap = vim.keymap.set
		local lsp = vim.lsp
		local opts = { silent = true }

		local function opt(desc, others)
			return vim.tbl_extend("force", opts, { desc = desc }, others or {})
		end

		keymap("n", "gd", lsp.buf.definition, opt("Go to definition"))
		keymap("n", "gD", function()
			local ok, diag = pcall(require, "rj.extras.definition")
			if ok then
				diag.get_def()
			end
		end, opt("Get the definition in a float"))
		keymap("n", "gi", function()
			lsp.buf.implementation({ border = "single" })
		end, opt("Go to implementation"))
		keymap("n", "gr", lsp.buf.references, opt("Show References"))
		keymap("n", "gl", vim.diagnostic.open_float, opt("Open diagnostic in float"))
		-- keymap("n", "<C-k>", lsp.buf.signature_help, opts)

		pcall(vim.keymap.del, "n", "K", { buffer = args.buf })
		keymap("n", "K", function()
			lsp.buf.hover({ border = "single", max_height = 30, max_width = 120 })
		end, opt("Toggle hover"))

		keymap("n", "<leader>lF", vim.cmd.FormatToggle, opt("Toggle AutoFormat"))
		keymap("n", "<leader>lI", vim.cmd.Mason, opt("Mason"))
		keymap("n", "<leader>lS", lsp.buf.workspace_symbol, opt("Workspace Symbols"))
		keymap("n", "<leader>la", lsp.buf.code_action, opt("Code Action"))
		keymap("n", "<leader>lh", function()
			lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled({}))
		end, opt("Toggle Inlayhints"))
		keymap("n", "<leader>li", vim.cmd.LspInfo, opt("LspInfo"))
		keymap("n", "<leader>lr", lsp.buf.rename, opt("Rename"))
		keymap("n", "<leader>ls", lsp.buf.document_symbol, opt("Doument Symbols"))

		keymap("n", "<leader>dD", function()
			local ok, diag = pcall(require, "rj.extras.workspace-diagnostic")
			if ok then
				for _, cur_client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
					diag.populate_workspace_diagnostics(cur_client, 0)
				end
				vim.notify("INFO: Diagnostic populated")
			end
		end, opt("Popluate diagnostic for the whole workspace"))
		keymap("n", "<leader>dn", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, opt("Next Diagnostic"))
		keymap("n", "<leader>dp", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, opt("Prev Diagnostic"))
		keymap("n", "<leader>dq", vim.diagnostic.setloclist, opt("Set LocList"))
		keymap("n", "<leader>dv", function()
			vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
		end, opt("Toggle diagnostic virtual_lines"))
	end,
})

vim.api.nvim_create_user_command("LspStart", function()
	vim.cmd.e()
end, { desc = "Starts LSP clients in the current buffer" })

vim.api.nvim_create_user_command("LspStop", function(opts)
	for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
		if opts.args == "" or opts.args == client.name then
			client:stop(true)
			vim.notify(client.name .. ": stopped")
		end
	end
end, {
	desc = "Stop all LSP clients or a specific client attached to the current buffer.",
	nargs = "?",
	complete = function(_, _, _)
		local clients = vim.lsp.get_clients({ bufnr = 0 })
		local client_names = {}
		for _, client in ipairs(clients) do
			table.insert(client_names, client.name)
		end
		return client_names
	end,
})

vim.api.nvim_create_user_command("LspRestart", function()
	local detach_clients = {}
	for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
		client:stop(true)
		if vim.tbl_count(client.attached_buffers) > 0 then
			detach_clients[client.name] = { client, vim.lsp.get_buffers_by_client_id(client.id) }
		end
	end
	local timer = vim.uv.new_timer()
	if not timer then
		return vim.notify("Servers are stopped but havent been restarted")
	end
	timer:start(
		100,
		50,
		vim.schedule_wrap(function()
			for name, client in pairs(detach_clients) do
				local client_id = vim.lsp.start(client[1].config, { attach = false })
				if client_id then
					for _, buf in ipairs(client[2]) do
						vim.lsp.buf_attach_client(buf, client_id)
					end
					vim.notify(name .. ": restarted")
				end
				detach_clients[name] = nil
			end
			if next(detach_clients) == nil and not timer:is_closing() then
				timer:close()
			end
		end)
	)
end, {
	desc = "Restart all the language client(s) attached to the current buffer",
})

vim.api.nvim_create_user_command("LspLog", function()
	vim.cmd.vsplit(vim.lsp.log.get_filename())
end, {
	desc = "Get all the lsp logs",
})

vim.api.nvim_create_user_command("LspInfo", function()
	vim.cmd("silent checkhealth vim.lsp")
end, {
	desc = "Get all the information about all LSP attached",
})

vim.lsp.enable(servers)
