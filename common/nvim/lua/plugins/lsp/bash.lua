local setup = function(on_attach, capabilities)
	require("lspconfig").bashls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "sh", "bash" },
	})
end

local lang = {
	require("efmls-configs.linters.shellcheck"),
	require("efmls-configs.formatters.shfmt"),
}

return {
	setup = setup,
	lang = lang,
}
