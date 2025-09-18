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
				library = {
					vim.env.VIMRUNTIME .. "/lua",
				},
			},
		},
	},
}

return {
	server = server,
	filetypes = filetypes,
	config = config,
}
