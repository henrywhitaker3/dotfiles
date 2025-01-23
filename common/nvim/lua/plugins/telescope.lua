return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	-- lazy = true,
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			pickers = {
				find_files = {
					theme = "dropdown",
					previewer = false,
				},
				live_grep = {
					theme = "dropdown",
				},
				buffers = {
					theme = "dropdown",
					previewer = false,
				},
				git_files = {
					theme = "dropdown",
					previewer = false,
				},
			},
		})

		vim.keymap.set("n", "<leader>ps", ":Telescope live_grep<CR>", {})
		vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>", {})
		vim.keymap.set("n", "<leader>pf", ":Telescope git_files<CR>", {})
		vim.keymap.set("n", "<leader>pb", ":Telescope buffers<CR>", {})
		vim.keymap.set("n", "<leader>gs", ":Telescope git_status<CR>", {})
		vim.keymap.set("n", "<leader>gcm", ":Telescope git_commits<CR>", {})
	end,
}
