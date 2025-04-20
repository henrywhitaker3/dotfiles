return {
	"jiaoshijie/undotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function(_, opts)
		require("undotree").setup(opts)
		vim.keymap.set("n", "<leader>u", require("undotree").toggle, { noremap = true, silent = true })
	end,
}
