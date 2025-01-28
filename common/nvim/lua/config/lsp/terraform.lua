local filetypes = { "terraform" }

local setup = function(on_attach, capabilities)
	require("lspconfig").terraformls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = filetypes,
		settings = {},
	})
end

local lang = {
	require("efmls-configs.formatters.terraform_fmt"),
}

local efm = { "terraform" }

return {
	setup = setup,
	lang = lang,
	efm = efm,
	filetypes = filetypes,
}
