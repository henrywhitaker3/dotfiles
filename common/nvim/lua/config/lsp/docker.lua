local filetypes = { "docker" }

local setup = function(on_attach, capabilities)
	require("lspconfig").dockerls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = filetypes,
	})
end

local lang = {
	require("efmls-configs.linters.hadolint"),
}

local efm = { "docker" }

return {
	setup = setup,
	lang = lang,
	efm = efm,
	filetypes = filetypes,
}
