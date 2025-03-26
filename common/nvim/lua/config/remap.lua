vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>f", ":NvimTreeFocus<CR>", opts)
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", opts)
vim.keymap.set({ "i", "v" }, "<C-c>", "<Esc><Esc>", opts)

vim.keymap.set({ "n", "v" }, "sy", '"*y')
vim.keymap.set({ "n", "v" }, "sp", '"*p')

-- Save
vim.keymap.set("i", "<C-s>", "<esc>:w<CR>i", opts)
vim.keymap.set("n", "<C-s>", ":w<CR>", opts)

-- Duplicate lines
vim.keymap.set("n", "<leader>dj", "yyjP", opts)
vim.keymap.set("n", "<leader>dk", "yykp", opts)

-- Move lines
vim.keymap.set("n", "<leader>mj", "ddjP", opts)
vim.keymap.set("n", "<leader>mk", "ddkkp", opts)

-- Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)
vim.keymap.set("n", "<leader>sh", ":split<CR>", opts)
vim.keymap.set("n", "<leader>cd", ":chdir<Space>", opts)
vim.keymap.set("n", "<leader>qa", ":qa<CR>", opts)
vim.keymap.set({ "n", "v" }, "H", "^", opts)
vim.keymap.set({ "n", "v" }, "L", "$", opts)

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
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", opts)

vim.keymap.set("n", "<leader>nt", ":terminal<CR>", opts)

-- Git
vim.keymap.set("n", "<leader>gp", ":! git pull<CR>", opts)
vim.keymap.set("n", "<leader>gst", ":! git stash<CR>", opts)
vim.keymap.set("n", "<leader>gsp", ":! git stash pop<CR>", opts)
vim.keymap.set("n", "<leader>gb", function()
	local to = 1
	if vim.g.gitblame_display_virtual_text == 1 then
		to = 0
	end
	vim.g.gitblame_display_virtual_text = to
end, opts)
