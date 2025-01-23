return {
	"NeogitOrg/neogit",
	dependencies = {
		"sindrets/diffview.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>gi", ":Neogit<CR>")
	end,
}
