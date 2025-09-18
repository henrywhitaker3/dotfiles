local server = "yamlls"
local filetypes = { "yaml" }
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
