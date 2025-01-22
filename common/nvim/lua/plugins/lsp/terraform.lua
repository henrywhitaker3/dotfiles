local setup = function(on_attach, capabilities)
	require("lspconfig").terraformls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "terraform" },
		settings = {},
	})
end

local lang = {
	require("efmls-configs.formatters.terraform_fmt"),
}

return {
	setup = setup,
	lang = lang,
}
