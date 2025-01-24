local setup = function(on_attach, capabilites)
	local util = require("lspconfig/util")

	require("lspconfig").gopls.setup({
		on_attach = on_attach,
		capabilites = capabilites,
		cmd = { "gopls" },
		filetypes = { "go", "gomod", "gowork", "gotmpl" },
		root_dir = util.root_pattern("go.work", "go.mod", ".git"),
		settings = {
			gopls = {
				completeUnimported = true,
				usePlaceholders = true,
				analyses = {
					unusedparams = true,
					nilness = true,
				},
			},
		},
	})
end

local lang = {
	require("efmls-configs.formatters.golines"),
	require("efmls-configs.formatters.gofmt"),
	require("efmls-configs.formatters.goimports"),
}

return {
	setup = setup,
	lang = lang,
}
