vim.cmd("let g:omni_sql_no_default_maps = 1")

vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", opts)
vim.keymap.set({ "i", "v" }, "<C-c>", "<Esc><Esc>", opts)

vim.keymap.set({ "n", "v" }, "sy", '"*y')
vim.keymap.set({ "n", "v" }, "sp", '"*p')

-- Save
vim.keymap.set("i", "<C-s>", "<esc>:w<CR>i", opts)
vim.keymap.set("n", "<C-s>", ":w<CR>", opts)

-- Move lines
vim.keymap.set("n", "<leader>mj", "ddjP", opts)
vim.keymap.set("n", "<leader>mk", "ddkkp", opts)

-- Navigation
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)
vim.keymap.set("n", "<leader>sh", ":split<CR>", opts)
vim.keymap.set("n", "<leader>cd", ":chdir<Space>", opts)
vim.keymap.set("n", "<leader>qa", ":qa<CR>", opts)
vim.keymap.set({ "n", "v", "o" }, "H", "^", opts)
vim.keymap.set({ "n", "v", "o" }, "L", "$", opts)

-- Commenting
vim.api.nvim_set_keymap("i", "<C-/>", "<esc>gcc<S-a>", { noremap = false })
vim.api.nvim_set_keymap("i", "<C-_>", "<esc>gcc<S-a>", { noremap = false })
vim.api.nvim_set_keymap("n", "<C-/>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-/>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false })

-- Indenting
vim.keymap.set("v", "<C-[>", "<gv", opts)
vim.keymap.set("n", "<C-[>", "v<gv<esc>", { noremap = false })
vim.keymap.set("v", "<C-]>", ">gv", opts)
vim.keymap.set("n", "<C-]>", "v>gv<esc>", { noremap = false })

-- Buffers
vim.keymap.set("n", "<leader>bw", ":bw<CR>:bnext<CR>", opts)
vim.keymap.set("n", "<leader>bn", ":enew<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>br", ":checktime<CR>", opts)
vim.keymap.set("n", "<C-q>", function()
	for _, win in ipairs(vim.fn.getwininfo()) do
		if win.quickfix == 1 then
			vim.cmd("cclose")
			return
		end
	end
	vim.cmd("copen")
end, opts)

-- Git
vim.keymap.set("n", "<leader>gb", function()
	local to = 1
	if vim.g.gitblame_display_virtual_text == 1 then
		to = 0
	end
	vim.g.gitblame_display_virtual_text = to
end, opts)
