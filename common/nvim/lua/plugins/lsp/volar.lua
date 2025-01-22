local setup = function(on_attach, capabilities)
	require("lspconfig").volar.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "typescript", "javascript", "vue" },
		settings = {
			vue = {
				hybridMode = false,
			},
		},
		init_options = {
			typescript = {
				tsdk = vim.env.HOME
					.. "/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib/",
			},
		},
	})
end

local lang = {
	require("efmls-configs.linters.eslint_d"),
	require("efmls-configs.formatters.eslint_d"),
}

return {
	setup = setup,
	lang = lang,
}
