local server = "protols"
local filetypes = { "proto" }

local config = {
	on_init = function(client)
		client.server_capabilities.textDocumentSync.save = nil
	end,
}

return {
	server = server,
	filetypes = filetypes,
	config = config,
}
