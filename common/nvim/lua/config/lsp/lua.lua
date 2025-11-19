local server = "lua_ls"
local filetypes = { "lua" }
local config = {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				checkThirdParty = false,
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
}

return {
	server = server,
	filetypes = filetypes,
	config = config,
}
