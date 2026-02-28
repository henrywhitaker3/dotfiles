return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	dependencies = { "saghen/blink.cmp" },
	opts = {
		preview = {
			enable = false,
		},
	},
	keys = {
		{
			"<leader>mt",
			function()
				vim.cmd("Markview Toggle")
			end,
			desc = "Toggle the Markview previewer",
		},
		{
			"<leader>mp",
			function()
				vim.cmd("Markview splitToggle")
			end,
			desc = "Toggle the Markview split previewer",
		},
	},
}
