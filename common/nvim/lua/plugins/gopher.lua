return {
	"olexsmir/gopher.nvim",
	ft = "go",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	build = function()
		vim.cmd.GoInstallDeps()
	end,
	config = function(_, opts)
		require("gopher").setup(opts)
		vim.keymap.set("i", "<C-g>e", "<cmd>GoIfErr<CR>", { noremap = true, silent = true })
	end,
}
