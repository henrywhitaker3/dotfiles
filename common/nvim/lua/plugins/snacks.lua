return {
	"folke/snacks.nvim",
	opts = {
		lazygit = {
			configure = true,
		},
		picker = {},
	},
	keys = {
		{
			"<leader>gi",
			function()
				Snacks.lazygit.open()
			end,
		},
		{
			"<C-p>",
			function()
				Snacks.picker.files({ layout = "dropdown" })
			end,
		},
		{
			"<leader>pf",
			function()
				Snacks.picker.files({ layout = { preview = false, preset = "vertical" } })
			end,
		},
		{
			"<leader>ps",
			function()
				Snacks.picker.grep({ layout = "dropdown" })
			end,
		},
		{
			"<leader>pw",
			function()
				Snacks.picker.grep_word({ layout = "dropdown" })
			end,
		},
		{
			"<leader>pb",
			function()
				Snacks.picker.buffers({ layout = "dropdown" })
			end,
		},
		{
			"<leader>po",
			function()
				Snacks.picker.lsp_symbols({ layout = "dropdown" })
			end,
		},
		{
			"<leader>pr",
			function()
				Snacks.picker.lsp_references({ layout = "dropdown" })
			end,
		},
		{
			"<leader>pm",
			function()
				Snacks.picker.marks({ layout = "dropdown" })
			end,
		},
	},
}
