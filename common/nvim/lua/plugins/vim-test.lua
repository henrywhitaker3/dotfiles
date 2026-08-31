return {
	"vim-test/vim-test",
	config = function()
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>ta", ":TestSuite<CR>", vim.tbl_extend("force", {}, opts, { desc = "Run test suite" }))
		vim.keymap.set("n", "<leader>tn", ":TestNearest<CR>", vim.tbl_extend("force", {}, opts, { desc = "Run nearest test" }))
		vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", vim.tbl_extend("force", {}, opts, { desc = "Run last test" }))
		vim.keymap.set("n", "<leader>tf", ":TestFile<CR>", vim.tbl_extend("force", {}, opts, { desc = "Run test file" }))
	end,
}
