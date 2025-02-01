local filetypes = { "typescript", "javascript", "vue" }

local setup = function(on_attach, capabilities)
	require("lspconfig").volar.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = filetypes,
		settings = {
			vue = {
				hybridMode = false,
			},
		},
		init_options = {
			typescript = {
				tsdk = vim.env.HOME
					.. "/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib/",
			},
		},
	})
end

return {
	setup = setup,
	filetypes = filetypes,
}
