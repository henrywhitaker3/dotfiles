return {
	"leoluz/nvim-dap-go",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	ft = "go",
	config = function(_, options)
		require("dap-go").setup(options)
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>ddt", function()
			require("dap-go").debug_test()
		end, opts)
	end,
}
