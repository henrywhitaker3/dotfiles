local server = "taplo"
local filetypes = { "toml" }
local keys = {
	["<leader>tml"] = {
		modes = { "n" },
		desc = "Add a mise TOML schema hint",
		action = function()
			local row = vim.api.nvim_win_get_cursor(0)[1]
			vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, {
				"#:schema https://mise.jdx.dev/schema/mise.json",
			})
			vim.api.nvim_win_set_cursor(0, { row + 1, #"#:schema https://mise.jdx.dev/schema/mise.json" })
		end,
	},
}

return {
	server = server,
	filetypes = filetypes,
	keys = keys,
}
