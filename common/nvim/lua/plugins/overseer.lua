return {
	"stevearc/overseer.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-telescope/telescope.nvim", "stevearc/dressing.nvim" },
	config = function(_, opts)
		require("overseer").setup(opts)
		vim.keymap.set("n", "<leader>pt", ":OverseerRun<CR>", { noremap = true, silent = true })
	end,
}
