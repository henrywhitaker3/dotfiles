local disabled_filetypes = {
	"gitcommit",
}

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
			["<Tab>"] = { "select_and_accept", "fallback" },
			["<C-n>"] = { "snippet_forward", "fallback" },
			["<C-p>"] = { "snippet_backward", "fallback" },
		},
		sources = {
			cmdline = {},
		},
		completion = {
			ghost_text = { enabled = true },
		},
		enabled = function()
			return not vim.tbl_contains(disabled_filetypes, vim.bo.filetype)
				and vim.bo.buftype ~= "prompt"
				and vim.b.completion ~= false
		end,
	},
	opts_extend = {
		"completion.default",
	},
}
