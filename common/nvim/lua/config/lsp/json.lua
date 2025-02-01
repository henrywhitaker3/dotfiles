local filetypes = { "json", "jsonc" }

local setup = function(on_attach, capabilities)
	require("lspconfig").jsonls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = filetypes,
	})
end

return {
	setup = setup,
	filetypes = filetypes,
}
