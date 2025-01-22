return function(on_attach, capabilities)
	require("lspconfig").volar.setup({
		on_attach = on_attach,
		capabilities = capabilities,
        filetypes = { "typescript", "javascript", "vue" },
		settings = {
			vue = {
				hybridMode = false,
			},
		},
	})
end
