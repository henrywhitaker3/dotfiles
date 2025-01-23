local setup = function(on_attach, capabilities)
	require("lspconfig").jsonls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "json", "jsonc" },
	})
end

local lang = {
	require("efmls-configs.linters.jsonlint"),
	require("efmls-configs.formatters.jq"),
}

return {
	setup = setup,
	lang = lang,
}
