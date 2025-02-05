return {
	"mfussenegger/nvim-dap",
	config = function()
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", opts)
		vim.keymap.set("n", "<leader>dcb", "<cmd>DapClearBreakpoints<CR>", opts)
		vim.keymap.set("n", "<leader>dso", "<cmd>DapStepOver<CR>", opts)
		vim.keymap.set("n", "<leader>dsi", "<cmd>DapStepInto<CR>", opts)
		vim.keymap.set("n", "<leader>dt", "<cmd>DapTerminate<CR>", opts)
	end,
}
