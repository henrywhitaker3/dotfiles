local filetypes = { "json", "jsonc" }

local setup = function(on_attach, capabilities)
	require("lspconfig").jsonls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = filetypes,
	})
end

local lang = {
	require("efmls-configs.linters.jsonlint"),
	require("efmls-configs.formatters.jq"),
}

local efm = { "json" }

return {
	setup = setup,
	lang = lang,
	efm = efm,
	filetypes = filetypes,
}
