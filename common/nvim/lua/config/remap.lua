vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>f", ":NvimTreeFocus<CR>", opts)
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", opts)

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

-- Commenting
vim.api.nvim_set_keymap("i", "<C-/>", "<esc>gcc<S-a>", { noremap = false })
vim.api.nvim_set_keymap("i", "<C-_>", "<esc>gcc<S-a>", { noremap = false })
vim.api.nvim_set_keymap("n", "<C-/>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-/>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false })

-- Indeting
vim.keymap.set("v", "<C-[>", "<gv", opts)
vim.keymap.set("n", "<C-[>", "v<gv<esc>", { noremap = false })
vim.keymap.set("v", "<C-]>", ">gv", opts)
vim.keymap.set("n", "<C-]>", "v>gv<esc>", { noremap = false })

-- Buffers
vim.keymap.set("n", "<leader>bw", ":bw<CR>", opts)
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", opts)

-- Git
vim.keymap.set("n", "<leader>gp", ":! git pull<CR>", opts)
vim.keymap.set("n", "<leader>gst", ":! git stash<CR>", opts)
vim.keymap.set("n", "<leader>gsp", ":! git stash pop<CR>", opts)
