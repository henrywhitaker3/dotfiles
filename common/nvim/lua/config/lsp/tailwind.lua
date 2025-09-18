local server = "tailwindcss"
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

local config = {
	root_dir = function(bufnr, on_dir)
		local root_files = {
			-- Generic
			"tailwind.config.js",
			"tailwind.config.cjs",
			"tailwind.config.mjs",
			"tailwind.config.ts",
			"postcss.config.js",
			"postcss.config.cjs",
			"postcss.config.mjs",
			"postcss.config.ts",
			-- Django
			"theme/static_src/tailwind.config.js",
			"theme/static_src/tailwind.config.cjs",
			"theme/static_src/tailwind.config.mjs",
			"theme/static_src/tailwind.config.ts",
			"theme/static_src/postcss.config.js",
			-- Fallback for tailwind v4, where tailwind.config.* is not required anymore
			".git",
		}
		local fname = vim.api.nvim_buf_get_name(bufnr)
		local util = require("lspconfig.util")
		root_files = util.insert_package_json(root_files, "tailwindcss", fname)
		root_files = util.root_markers_with_field(root_files, { "mix.lock", "Gemfile.lock" }, "tailwind", fname)
		on_dir(vim.fs.dirname(vim.fs.find(root_files, { path = fname, upward = true })[1]))
	end,
}

return {
	server = server,
	filetypes = filetypes,
	config = config,
}
