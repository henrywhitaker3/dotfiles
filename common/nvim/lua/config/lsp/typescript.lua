local filetypes = { "javascript", "typescript" }

local setup = function(on_attach, capabilities)
	require("lspconfig").ts_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = filetypes,
	})
end

local lang = {
	require("efmls-configs.linters.eslint_d"),
	require("efmls-configs.formatters.eslint_d"),
}

local efm = { "typescript", "javascript" }

return {
	setup = setup,
	lang = lang,
	efm = efm,
	filetypes = filetypes,
}
