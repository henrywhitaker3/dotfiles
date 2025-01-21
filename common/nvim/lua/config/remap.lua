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
vim.api.nvim_set_keymap("n", "<C-/>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-/>", "gcc", { noremap = false })
-- Indeting
vim.keymap.set("v", "<C-[>", "<gv", opts)
vim.keymap.set("v", "<C-]>", ">gv", opts)
