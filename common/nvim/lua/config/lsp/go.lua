local server = "gopls"
local filetypes = { "go", "gowork", "gotempl" }

local config = {
	cmd = { "gopls" },
	settings = {
		gopls = {
			completeUnimported = true,
			staticcheck = true,
			analyses = {
				unusedparams = true,
				nilness = true,
			},
		},
	},
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	callback = function()
		vim.keymap.set({ "n", "v" }, "<leader>gt", ":GoTagAdd<CR>", { noremap = true, silent = true })
	end,
})

return {
	server = server,
	filetypes = filetypes,
	config = config,
}
