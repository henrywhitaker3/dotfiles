return {
	"vim-test/vim-test",
	config = function()
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>ta", ":TestSuite<CR>", opts)
		vim.keymap.set("n", "<leader>tn", ":TestNearest<CR>", opts)
		vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", opts)
		vim.keymap.set("n", "<leader>tf", ":TestFile<CR>", opts)
	end,
}
