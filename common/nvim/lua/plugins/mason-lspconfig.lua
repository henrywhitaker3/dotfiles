return {
	"williamboman/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"efm",
			"lua_ls",
			"yamlls",
			"helm_ls",
			"jsonls",
			"gols",
			"volar",
			"sqlls",
			"ts_ls",
			"bashls",
			"terraformls",
		},
		automatic_installation = true,
	},
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
