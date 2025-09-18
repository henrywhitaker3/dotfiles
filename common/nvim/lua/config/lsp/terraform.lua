local server = "terraformls"
local filetypes = { "terraform", "terraform-vars", "tf", "tfvars" }
local config = {
	settings = {},
}

return {
	server = server,
	filetypes = filetypes,
	config = config,
}
