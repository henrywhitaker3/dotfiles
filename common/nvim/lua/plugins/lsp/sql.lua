local setup = function(on_attach, capabilities)
	require("lspconfig").sqlls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "sql", "mysql" },
	})
end

local lang = {
	require("efmls-configs.linters.sqlfluff"),
	require("efmls-configs.formatters.sqlfluff"),
}

return {
	setup = setup,
	lang = lang,
}
