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
local keys = {
	["<leader>gt"] = {
		modes = { "n" },
		desc = "Run go mod tidy",
		action = function()
			vim.cmd("!go mod tidy")
		end,
	},
}

return {
	server = server,
	filetypes = filetypes,
	config = config,
	keys = keys,
}
