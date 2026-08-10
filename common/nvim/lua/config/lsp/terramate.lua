local server = "terramate_ls"
local filetypes = { "terramate" }
local config = {
	cmd = { "terramate-ls" },
	root_markers = { "terramate.tm.hcl", "terramate.tm", ".git" },
	settings = {},
}

return {
	server = server,
	filetypes = filetypes,
	config = config,
}
