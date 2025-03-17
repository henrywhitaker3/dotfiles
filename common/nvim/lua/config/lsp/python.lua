local filetypes = { "python" }

local setup = function(on_attach, capabilities)
	require("lspconfig").pylsp.setup({
		filetypes = filetypes,
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return {
	filetypes = filetypes,
	setup = setup,
}
