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
