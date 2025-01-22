local setup = function(on_attach, capabilities)
	require("lspconfig").ts_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "javascript", "typescript" },
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
