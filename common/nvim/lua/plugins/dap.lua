return {
	"mfussenegger/nvim-dap",
	config = function()
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", opts)
		vim.keymap.set("n", "<leader>dcb", "<cmd>DapClearBreakpoints<CR>", opts)
		vim.keymap.set("n", "<leader>dso", "<cmd>DapStepOver<CR>", opts)
		vim.keymap.set("n", "<leader>dsi", "<cmd>DapStepInto<CR>", opts)
		vim.keymap.set("n", "<leader>dt", "<cmd>DapTerminate<CR>", opts)

		vim.api.nvim_set_hl(0, "red", { fg = "#cc122e" })
		vim.api.nvim_set_hl(0, "blue", { fg = "#3d59a1" })
		vim.api.nvim_set_hl(0, "green", { fg = "#9ece6a" })
		vim.api.nvim_set_hl(0, "yellow", { fg = "#FFFF00" })
		vim.api.nvim_set_hl(0, "orange", { fg = "#f09000" })

		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "•", texthl = "red", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "•", texthl = "blue", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapBreakpointRejected",
			{ text = "•", texthl = "orange", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapStopped",
			{ text = "•", texthl = "green", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapLogPoint",
			{ text = "•", texthl = "yellow", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
	end,
}
