return {
	"NeogitOrg/neogit",
	dependencies = {
		{
			"sindrets/diffview.nvim",
			config = function(opts)
				require("diffview").setup(opts)
				vim.keymap.set("n", "<leader>cc", "<cmd>DiffviewClose<CR>")
			end,
		},
	},
	config = function()
		vim.keymap.set("n", "<leader>gi", ":Neogit<CR>")
	end,
}
