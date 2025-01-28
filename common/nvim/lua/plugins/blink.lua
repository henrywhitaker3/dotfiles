return {
	"Saghen/blink.cmp",
	version = "*",
	dependencies = {
		"L3MON4D3/LuaSnip",
		dependencies = {
			{
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip/loaders/from_vscode").lazy_load()
				end,
			},
		},
	},
	opts = {
		keymap = {
			preset = "default",
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<CR>"] = { "select_and_accept", "fallback" },
		},
		sources = {
			cmdline = {},
		},
		completion = {
			ghost_text = { enabled = true },
		},
		enabled = function()
			return vim.bo.filetype ~= "gitcommit" and vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
		end,
	},
	opts_extend = {
		"completion.default",
	},
}
