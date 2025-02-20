local filetypes = {
	"aspnetcorerazor",
	"astro",
	"astro-markdown",
	"blade",
	"clojure",
	"django-html",
	"htmldjango",
	"edge",
	"eelixir",
	"elixir",
	"ejs",
	"erb",
	"eruby",
	"gohtml",
	"gohtmltmpl",
	"haml",
	"handlebars",
	"hbs",
	"html",
	"htmlangular",
	"html-eex",
	"heex",
	"jade",
	"leaf",
	"liquid",
	"markdown",
	"mdx",
	"mustache",
	"njk",
	"nunjucks",
	"php",
	"razor",
	"slim",
	"twig",
	"css",
	"less",
	"postcss",
	"sass",
	"scss",
	"stylus",
	"sugarss",
	"javascript",
	"javascriptreact",
	"reason",
	"rescript",
	"typescript",
	"typescriptreact",
	"vue",
	"svelte",
	"templ",
}

local setup = function(on_attach, capabilities)
	require("lspconfig").tailwindcss.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = filetypes,
		root_dir = function(fname)
			local util = require("lspconfig.util")
			local root = util.root_pattern("tailwind.config.js", "tailwind.config.ts")(fname)
				or util.root_pattern("nuxt.config.ts")(fname)
				or util.root_pattern("postcss.config.js", "postcss.config.ts")(fname)
				or util.find_package_json_ancestor(fname)
				or util.find_node_modules_ancestor(fname)
				or util.find_git_ancestor(fname)
			print(root)
			return root
		end,
	})
end

return {
	filetypes = filetypes,
	setup = setup,
}
