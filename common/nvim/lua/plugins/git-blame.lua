return {
	"f-person/git-blame.nvim",
	-- load the plugin at startup
	event = "VeryLazy",
	opts = {
		enabled = true,
	},
	config = function(_, opts)
		require("gitblame").setup(opts)
		vim.g.gitblame_display_virtual_text = 0
	end,
}
