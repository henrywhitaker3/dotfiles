local setup = function(on_attach, capabilities)
	require("lspconfig").helm_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "helm" },
	})
	require("lspconfig").yamlls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "yaml" },
		settings = {
			yaml = {
				lineLenght = false,
			},
		},
	})
end

local yamllint = function()
	local yamllint = require("efmls-configs.linters.yamllint")
	local fs = require("efmls-configs.fs")
	local linter = "yamllint"
	local args = '-f parsable -d "{extends: default, rules: {line-length: disable}}" -'
	yamllint.lintCommand = string.format("%s %s", fs.executable(linter), args)
	return yamllint
end

local lang = {
	yamllint(),
	require("efmls-configs.linters.actionlint"),
	require("efmls-configs.linters.ansible_lint"),
	require("efmls-configs.formatters.prettier"),
}

return {
	setup = setup,
	lang = lang,
}
