return {
	"williamboman/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"efm",
			"lua_ls",
		},
		automatic_installation = true,
	},
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
