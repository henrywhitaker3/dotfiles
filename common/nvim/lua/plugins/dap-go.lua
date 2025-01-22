return {
	"leoluz/nvim-dap-go",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	ft = "go",
	config = function(_, options)
		require("dap-go").setup(options)
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>gdt", function()
			require("dap-go").debug_test()
		end, opts)
		vim.keymap.set("n", "<leader>dso", "<cmd>DapStepOver<CR>", opts)
		vim.keymap.set("n", "<leader>dsi", "<cmd>DapStepInto<CR>", opts)
		vim.keymap.set("n", "<leader>dt", "<cmd>DapTerminate<CR>", opts)
	end,
}
