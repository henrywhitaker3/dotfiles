local setup = function(on_attach, capabilities)
	require("lspconfig").helm_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "helm" },
	})
	require("lspconfig").yamlls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "yaml" },
	})
end

local lang = {
	require("efmls-configs.linters.yamllint"),
	require("efmls-configs.linters.actionlint"),
	require("efmls-configs.linters.ansible_lint"),
	require("efmls-configs.formatters.prettier"),
}

return {
	setup = setup,
	lang = lang,
}
