local filetypes = { "gleam" }

local setup = function(on_attach, capabilities)
	require("lspconfig").gleam.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = filetypes,
	})
end

return {
	setup = setup,
	filetypes = filetypes,
}
