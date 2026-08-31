vim.cmd("let g:omni_sql_no_default_maps = 1")

vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
local function map(mode, lhs, rhs, desc, options)
	vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", {}, options or opts, { desc = desc }))
end

map({ "i", "v" }, "<C-c>", "<Esc><Esc>", "Exit insert or visual mode")

map({ "n", "v" }, "sy", '"+y', "Yank to system clipboard")
map({ "n", "v" }, "sp", '"+p', "Paste from system clipboard")

-- Save
map("i", "<C-s>", "<esc>:w<CR>i", "Save file")
map("n", "<C-s>", ":w<CR>", "Save file")

-- Move lines
map("n", "<leader>mj", "ddjP", "Move line down")
map("n", "<leader>mk", "ddkkp", "Move line up")

-- Navigation
map("n", "<leader>sv", ":vsplit<CR>", "Split window vertically")
map("n", "<leader>sh", ":split<CR>", "Split window horizontally")
map("n", "<leader>cd", ":chdir<Space>", "Change working directory")
map("n", "<leader>qa", ":qa<CR>", "Quit all")
map({ "n", "v", "o" }, "H", "^", "Go to first non-blank character")
map({ "n", "v", "o" }, "L", "$", "Go to end of line")

-- Commenting
vim.api.nvim_set_keymap("i", "<C-/>", "<esc>gcc<S-a>", { noremap = false, desc = "Toggle comment" })
vim.api.nvim_set_keymap("i", "<C-_>", "<esc>gcc<S-a>", { noremap = false, desc = "Toggle comment" })
vim.api.nvim_set_keymap("n", "<C-/>", "gcc", { noremap = false, desc = "Toggle comment" })
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false, desc = "Toggle comment" })
vim.api.nvim_set_keymap("v", "<C-/>", "gcc", { noremap = false, desc = "Toggle comment selection" })
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false, desc = "Toggle comment selection" })

-- Indenting
map("v", "<C-[>", "<gv", "Unindent selection")
map("n", "<C-[>", "v<gv<esc>", "Unindent line", { noremap = false })
map("v", "<C-]>", ">gv", "Indent selection")
map("n", "<C-]>", "v>gv<esc>", "Indent line", { noremap = false })

-- Buffers
map("n", "<leader>bn", ":enew<CR>", "Create new buffer")
map("n", "<S-Tab>", ":bnext<CR>", "Next buffer")
map("n", "<leader>bp", ":bprevious<CR>", "Previous buffer")
map("n", "<leader>br", ":checktime<CR>", "Reload changed buffers")
map("n", "<C-q>", function()
	for _, win in ipairs(vim.fn.getwininfo()) do
		if win.quickfix == 1 then
			vim.cmd("cclose")
			return
		end
	end
	vim.cmd("copen")
end, "Toggle quickfix list")

-- Git
map("n", "<leader>gb", function()
	local to = 1
	if vim.g.gitblame_display_virtual_text == 1 then
		to = 0
	end
	vim.g.gitblame_display_virtual_text = to
end, "Toggle Git blame")
