local languages = {
	"c",
	"lua",
	"vim",
	"vimdoc",
	"query",
	"elixir",
	"heex",
	"javascript",
	"html",
	"typescript",
	"go",
	"bash",
	"json",
	"yaml",
	"gitignore",
	"dockerfile",
	"markdown",
	"markdown_inline",
	"css",
	"terraform",
	"hcl",
	"vue",
	"proto",
	"helm",
	"gleam",
	"python",
	"c_sharp",
}

return {
	{
		"MeanderingProgrammer/treesitter-modules.nvim",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter",
				build = ":TSUpdate",
			},
		},
		opts = {
			ensure_installed = languages,
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		},
	},
}
