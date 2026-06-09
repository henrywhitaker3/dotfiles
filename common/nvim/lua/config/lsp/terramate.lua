local server = "terramate-ls"
local filetypes = { "terramate" }

local config = {
	default_config = {
		cmd = { "terramate-ls" },
		filetypes = { "terramate" },
		root_dir = function()
			local util = require("lspconfig.util")
			return util.root_pattern(".git", "terramate.tm.hcl")
		end,
	},
}

return {
	server = server,
	filetypes = filetypes,
	config = config,
}
