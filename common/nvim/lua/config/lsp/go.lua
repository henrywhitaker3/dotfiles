local filetypes = { "go", "gomod", "gowork", "gotempl" }

local setup = function(on_attach, capabilites)
	local util = require("lspconfig/util")

	require("lspconfig").gopls.setup({
		on_attach = on_attach,
		capabilites = capabilites,
		cmd = { "gopls" },
		filetypes = filetypes,
		root_dir = util.root_pattern("go.work", "go.mod", ".git"),
		settings = {
			gopls = {
				completeUnimported = true,
				staticcheck = true,
				analyses = {
					unusedparams = true,
					nilness = true,
				},
			},
		},
	})
end

return {
	setup = setup,
	filetypes = filetypes,
}
