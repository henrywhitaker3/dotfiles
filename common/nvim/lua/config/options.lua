local opt = vim.opt

-- Tab / Indents
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Set default indentation for specific filetypes
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"tf",
		"tfvars",
		"terraform-vars",
		"hcl",
		"yaml",
		"yml",
		"typescript",
		"javascript",
		"js",
		"vue",
		"terraform",
		"proto",
		"helm",
		"html",
		"gleam",
	},
	callback = function()
		opt.tabstop = 2
		opt.shiftwidth = 2
		opt.softtabstop = 2
	end,
})

-- Automatically set all .tf files to terraform by default
vim.filetype.add({
	extension = {
		tf = "terraform",
	},
})
-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.colorcolumn = "100"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"

-- Behaviour
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
-- This treats words with a dash in as one word instead of splitting them
opt.iskeyword:append("-")
opt.mouse:append("a")
-- This line sets the host clipboard to the default register
-- opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.encoding = "UTF-8"

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = ""
opt.foldlevel = 99
opt.foldnestmax = 6
