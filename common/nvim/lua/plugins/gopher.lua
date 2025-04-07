return {
	"olexsmir/gopher.nvim",
	ft = "go",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function(_, opts)
		require("gopher").setup(opts)
		-- vim.cmd.GoInstallDeps()
		vim.keymap.set("i", "<C-g>e", "<cmd>GoIfErr<CR>", { noremap = true, silent = true })
	end,
}
