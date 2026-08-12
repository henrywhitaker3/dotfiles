local server = "terramate_ls"
local filetypes = { "terramate" }
local config = {
	cmd = { "terramate-ls" },
	root_markers = { "terramate.tm.hcl", "terramate.tm", ".git" },
	settings = {},
	on_init = function(client)
		client.server_capabilities.textDocumentSync.save = nil
	end,
}

return {
	server = server,
	filetypes = filetypes,
	config = config,
}
