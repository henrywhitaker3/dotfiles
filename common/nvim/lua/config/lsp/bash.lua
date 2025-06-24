local filetypes = { "sh", "bash" }

local setup = function(on_attach, capabilities)
	require("lspconfig").bashls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = filetypes,
	})
end

return {
	setup = setup,
	filetypes = filetypes,
}
