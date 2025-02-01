local filetypes = { "sql", "mysql" }

local setup = function(on_attach, capabilities)
	require("lspconfig").sqlls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = filetypes,
	})
end

return {
	setup = setup,
	filetypes = filetypes,
}
