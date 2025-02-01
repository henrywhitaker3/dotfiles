local filetypes = { "docker" }

local setup = function(on_attach, capabilities)
	require("lspconfig").dockerls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = filetypes,
	})
end

return {
	setup = setup,
	filetypes = filetypes,
}
