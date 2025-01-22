vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, opts)
vim.keymap.set("n", "<leader>f", ":NvimTreeFocus<CR>", opts)
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", opts)

-- Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)
vim.keymap.set("n", "<leader>sh", ":split<CR>", opts)

-- Commenting
vim.api.nvim_set_keymap("i", "<C-/>", "<esc>gcc<S-a>", { noremap = false })
vim.api.nvim_set_keymap("i", "<C-_>", "<esc>gcc<S-a>", { noremap = false })
vim.api.nvim_set_keymap("n", "<C-/>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-/>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false })

-- Indeting
vim.keymap.set("v", "<C-[>", "<gv", opts)
vim.keymap.set("v", "<C-]>", ">gv", opts)

-- Buffers
vim.keymap.set("n", "<leader>bw", ":bw<CR>", opts)
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", opts)
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", opts)

-- Git
vim.keymap.set("n", "<leader>gp", ":! git pull", opts)
vim.keymap.set("n", "<leader>gst", ":! git stash", opts)
vim.keymap.set("n", "<leader>gsp", ":! git stash pop", opts)
