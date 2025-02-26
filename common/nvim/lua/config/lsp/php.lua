local filetypes = { "php" }

local setup = function(on_attach, capabilities)
	require("lspconfig").intelephense.setup({
		filetypes = filetypes,
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return {
	filetypes = filetypes,
	setup = setup,
}
