local setup = function(on_attach, capabilities)
	require("lspconfig").dockerls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

local lang = {
	require("efmls-configs.linters.hadolint"),
}

return {
	setup = setup,
	lang = lang,
}
