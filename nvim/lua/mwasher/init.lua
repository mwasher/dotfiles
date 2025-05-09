-- Global init and require config modules

-- Setup clipboard to work properly when using remote nvim
if os.getenv("SSH_TTY") == nil then
	vim.opt.clipboard:append("unnamedplus")
else
	vim.opt.clipboard:append("unnamedplus")

	local function paste(reg)
		return function()
			local content = vim.fn.getreg('"')
			return vim.split(content, "\n")
		end
	end

	vim.g.clipboard = {
		name = "OSC 52",
		copy = {
			["+"] = require("vim.ui.clipboard.osc52").copy("+"),
			["*"] = require("vim.ui.clipboard.osc52").copy("*"),
		},
		paste = {
			["+"] = paste("+"),
			["*"] = paste("*"),
		},
	}
end

require("mwasher.config")
require("mwasher.plugins")
