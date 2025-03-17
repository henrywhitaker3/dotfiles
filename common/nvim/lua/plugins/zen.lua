return {
	"folke/zen-mode.nvim",
	config = function(_, opts)
		require("zen-mode").setup(opts)
		vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { noremap = true, silent = true })
	end,
}
