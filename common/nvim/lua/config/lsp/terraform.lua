local filetypes = { "terraform", "terraform-vars", "tf" }

local setup = function(on_attach, capabilities)
	require("lspconfig").terraformls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = filetypes,
		settings = {},
	})
end

return {
	setup = setup,
	filetypes = filetypes,
}
