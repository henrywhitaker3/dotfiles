return {
	"mfussenegger/nvim-dap",
	config = function()
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", opts)
		vim.keymap.set("n", "<leader>db", "<cmd>DapClearBreakpints<CR>", opts)
		vim.keymap.set("n", "<leader>dui", function()
			local widgets = require("dap.ui.widgets")
			local sidebar = widgets.sidebar(widgets.scopes)
			sidebar.open()
		end, opts)
	end,
}
