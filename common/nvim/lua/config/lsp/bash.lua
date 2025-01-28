local filetypes = { "sh", "bash" }

local setup = function(on_attach, capabilities)
	require("lspconfig").bashls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = filetypes,
	})
end

local efm = { "bash", "sh" }

local lang = {
	require("efmls-configs.linters.shellcheck"),
	require("efmls-configs.formatters.shfmt"),
}

return {
	setup = setup,
	lang = lang,
	efm = efm,
	filetypes = filetypes,
}
