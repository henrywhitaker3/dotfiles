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
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "select_and_accept", "fallback" },
			["<C-n>"] = { "snippet_forward", "fallback" },
			["<C-p>"] = { "snippet_backward", "fallback" },
		},
		cmdline = {
			keymap = {
				preset = "default",
				["<Tab>"] = { "show", "accept" },
				["<C-j>"] = { "select_next" },
				["<C-k>"] = { "select_prev" },
			},
			completion = { menu = { auto_show = true } },
		},
		completion = {
			ghost_text = { enabled = true },
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
				window = {
					border = "rounded",
					winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
				},
			},
			menu = {
				border = "rounded",
				winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
			},
			list = {
				selection = {
					preselect = function(_)
						if
							vim.bo.filetype == "vue"
							or vim.bo.filetype == "typescript"
							or vim.bo.filetype == "DressingInput"
							or vim.bo.filetype == "sagarename"
						then
							return false
						end
						return true
					end,
				},
			},
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
