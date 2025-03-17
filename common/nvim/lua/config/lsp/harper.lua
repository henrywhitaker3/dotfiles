local filetypes = {
	"c",
	"cpp",
	"cs",
	"gitcommit",
	"go",
	"html",
	"java",
	"javascript",
	"lua",
	"markdown",
	"nix",
	"python",
	"ruby",
	"rust",
	"swift",
	"toml",
	"typescript",
	"typescriptreact",
	"haskell",
	"cmake",
	"typst",
	"php",
	"dart",
}

local setup = function(on_attach, capabilities)
	require("lspconfig").harper_ls.setup({
		filetypes = filetypes,
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return {
	filetypes = filetypes,
	setup = setup,
}
