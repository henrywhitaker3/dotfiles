local filetypes = { "markdown", "markdown.mdx" }

local setup = function(on_attach, capabilities)
	require("lspconfig").marksman.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = filetypes,
	})
end

return {
	setup = setup,
	filetypes = filetypes,
}
