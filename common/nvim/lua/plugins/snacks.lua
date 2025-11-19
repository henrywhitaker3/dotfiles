return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		lazygit = {
			configure = true,
		},
		picker = {},
		indent = {
			animate = {
				enabled = false,
			},
		},
		gh = {},
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
				Snacks.picker.files({ hidden = true, layout = "dropdown" })
			end,
			desc = "Open snacks file picker",
		},
		{
			"<leader>pf",
			function()
				---@diagnostic disable-next-line: assign-type-mismatch
				Snacks.picker.files({ hidden = true, ignored = true, layout = { preview = false, preset = "vertical" } })
			end,
			desc = "Open snacks file picker with no preview",
		},
		{
			"<leader>ps",
			function()
				Snacks.picker.grep({ layout = "dropdown" })
			end,
			desc = "Open snacks search",
		},
		{
			"<leader>pw",
			function()
				Snacks.picker.grep_word({ layout = "dropdown" })
			end,
			desc = "Search for a word",
		},
		{
			"<leader>pb",
			function()
				Snacks.picker.buffers({ layout = "dropdown" })
			end,
			desc = "Show open buffers",
		},
		{
			"<leader>po",
			function()
				Snacks.picker.lsp_symbols({ layout = "dropdown" })
			end,
			desc = "Show lsp symbols",
		},
		{
			"<leader>pr",
			function()
				Snacks.picker.lsp_references({ layout = "dropdown" })
			end,
			desc = "Show lsp references",
		},
		{
			"<leader>pm",
			function()
				Snacks.picker.marks({ layout = "dropdown" })
			end,
			desc = "Show marks",
		},
		{
			"<leader>ghp",
			function()
				Snacks.picker.gh_pr()
			end,
			desc = "Show github pull requests",
		},
		{
			"<leader>ghi",
			function()
				Snacks.picker.gh_issue()
			end,
			desc = "Show github pull issues",
		},
	},
}
