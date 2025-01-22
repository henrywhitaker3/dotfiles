return {
	"NeogitOrg/neogit",
	config = function()
		vim.keymap.set("n", "<leader>gi", ":Neogit<CR>")
		vim.keymap.set("n", "<leader>gc", ":Neogit commit<CR>")
	end,
}
