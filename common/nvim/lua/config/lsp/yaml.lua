local server = "yamlls"
local filetypes = { "yaml", "yaml.helm-values" }
local config = {
	settings = {
		yaml = {
			lineLenght = false,
		},
	},
}

return {
	server = server,
	filetypes = filetypes,
	config = config,
}
