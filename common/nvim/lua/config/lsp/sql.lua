local filetypes = { "sql", "mysql" }

local setup = function(on_attach, capabilities)
	require("lspconfig").sqlls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = filetypes,
	})
end

local lang = {
	require("efmls-configs.linters.sqlfluff"),
	require("efmls-configs.formatters.sqlfluff"),
}

local efm = { "sql", "mysql" }

return {
	setup = setup,
	lang = lang,
	efm = efm,
	filetypes = filetypes,
}
