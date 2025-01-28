local filetypes = { "lua" }

local setup = function(on_attach, capabilities)
	require("lspconfig").lua_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = filetypes,
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
	})
end

local lang = {
	require("efmls-configs.linters.luacheck"),
	require("efmls-configs.formatters.stylua"),
}

local efm = { "lua" }

return {
	setup = setup,
	lang = lang,
	efm = efm,
	filetypes = filetypes,
}
