return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		routes = {
			{
				filter = {
					event = "notify",
					find = "No information available",
				},
				opts = {
					skip = true,
				},
			},
			{
				filter = {
					event = "Notify",
					find = "no matching language servers",
				},
				opts = {
					skip = true,
				},
			},
			{
				filter = {
					event = "Notify",
					find = "Client marksman quit with exit code 1 and signal 0. Check log for errors",
				},
				opts = {
					skip = true,
				},
			},
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		{
			"rcarriga/nvim-notify",
			opts = {
				timeout = 500,
			},
		},
	},
}
