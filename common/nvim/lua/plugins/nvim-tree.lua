return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = {
		sort = {
			sorter = "case_sensitive",
		},
		view = {
			width = 30,
			relativenumber = true,
			number = true,
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = false,
			custom = { "^\\.git" },
		},
	},
}
