local filetypes = { "javascript", "typescript", "vue" }

local vuePluginLocation = "/usr/local/lib/node_modules/@vue/language-server"
if vim.uv.fs_stat("/opt/homebrew/lib/node_modules/@vue/language-server") then
	vuePluginLocation = "/opt/homebrew/lib/node_modules/@vue/language-server"
end

local setup = function(on_attach, capabilities)
	print("Plugin location " .. vuePluginLocation)
	require("lspconfig").ts_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = filetypes,
		init_options = {
			plugins = { -- I think this was my breakthrough that made it work
				{
					name = "@vue/typescript-plugin",
					location = vuePluginLocation,
					languages = { "vue" },
				},
			},
		},
	})
end

local lang = {
	require("efmls-configs.linters.eslint_d"),
	require("efmls-configs.formatters.eslint_d"),
}

local efm = { "typescript", "javascript" }

return {
	setup = setup,
	lang = lang,
	efm = efm,
	filetypes = filetypes,
}
