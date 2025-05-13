-- Define desired vim.opt.* options and then apply them
for option, value in pairs({
	-- Default encoding
	encoding = "utf-8",

	-- Enable relative number bar by default
	number = true,
	relativenumber = true,
	ruler = true,

	-- Highlight line number we are on
	cursorline = true,

	-- Hide cmd bar, always show status bar and pane divider
	cmdheight = 0,
	laststatus = 3,

	-- Dissable support for modelines
	modelines = 0,

	-- Disable mode in command bar as we have it in ths status bar
	showmode = false,

	-- Enable mouse use in the editor
	mouse = "a",

	-- Default wrap to off with indicator and wapped lines are indented to the same level
	wrap = false,
	showbreak = "↪ ",
	breakindent = true,

	-- Some transparency for pop-up windows
	pumblend = 15,

	-- Move to start of line when moving with ctrl-b/f/d/u
	startofline = true,

	-- Expand tabs, default to two spaces, and delete by tab equivalent
	expandtab = true,
	tabstop = 2,
	shiftwidth = 2,
	backspace = "indent,eol,start",
	autoindent = true,
	smartindent = true,

	-- Save undo history, typically in ~/.local/state/nvim and use swap
	undofile = true,

	-- Disable swap and backup file creation
	backup = false,
	writebackup = false,
	swapfile = false,

	-- Case-insensitive search unless capital letter is present
	ignorecase = true,
	smartcase = true,

	-- Keep signcolumn on by default
	signcolumn = "yes",

	-- Decrease update time
	updatetime = 250,

	-- Decrease mapped sequence wait time
	timeoutlen = 300,

	-- Open splits down and to the right
	splitright = true,
	splitbelow = true,

	-- Enable characters or tabs, trailing spaces, etc.
	list = true,
	listchars = { tab = "  ", trail = "·", nbsp = "␣" },

	-- Disable end of buffer tildes
	fillchars = { eob = " " },

	-- Preview substitutions
	inccommand = "split",

	-- Keep buffer space below the cursor (does this actually work...?)
	scrolloff = 10,

	-- Give option to save if doing :q with unsaved changes
	confirm = true,

	-- 24-bit color enabled
	background = "dark",
	termguicolors = true,
}) do
	vim.opt[option] = value
end
