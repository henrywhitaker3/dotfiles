local server = "ts_ls"
local filetypes = { "javascript", "typescript", "vue" }

local vuePluginLocation = "/usr/local/lib/node_modules/@vue/language-server"
if vim.uv.fs_stat("/opt/homebrew/lib/node_modules/@vue/language-server") then
	vuePluginLocation = "/opt/homebrew/lib/node_modules/@vue/language-server"
end

local config = {
	init_options = {
		plugins = { -- I think this was my breakthrough that made it work
			{
				name = "@vue/typescript-plugin",
				location = vuePluginLocation,
				languages = { "vue" },
			},
		},
	},
}

return {
	server = server,
	filetypes = filetypes,
	config = config,
}
