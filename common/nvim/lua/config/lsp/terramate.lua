local server = "terramate-ls"
local filetypes = { "terramate" }

local config = {
	cmd = { "terramate-ls" },
	root_markers = { ".git" },
}

return {
	server = server,
	filetypes = filetypes,
	config = config,
}
