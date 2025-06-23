return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			open_mapping = "<leader>tt",
			size = 20,
		})
	end,
}
