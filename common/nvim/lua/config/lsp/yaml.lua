local server = "yamlls"
local filetypes = { "yaml", "yaml.helm-values" }
local config = {
	settings = {
		yaml = {
			lineLenght = false,
		},
	},
}
local keys = {
	["<leader>yl"] = {
		modes = { "n" },
		desc = "Add a yaml language server hint",
		action = function()
			local row = vim.api.nvim_win_get_cursor(0)[1]
			vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, {
				"---",
				"# yaml-language-server: $schema=",
			})
			vim.api.nvim_win_set_cursor(0, { row + 1, #"# yaml-language-server: $schema=" })
		end,
	},
}

return {
	server = server,
	filetypes = filetypes,
	config = config,
	keys = keys,
}
