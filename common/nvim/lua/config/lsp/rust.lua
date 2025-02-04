local filetypes = { "rust" }

local setup = function(on_attach, capabilities)
	require("lspconfig").rust_analyzer.setup({
		on_attach = on_attach,
		on_attach,
		capabilities = capabilities,
		filetypes = filetypes,
	})
end

return {
	setup = setup,
	filetypes = filetypes,
}
