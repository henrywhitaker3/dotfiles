return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"stevearc/conform.nvim",
	},
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofmt", "goimports" },
				yaml = { "prettierd" },
				helm = { "prettierd" },
				json = { "prettierd" },
				typescript = { "eslint_d" },
				vue = { "eslint_d" },
				javascript = { "eslint_d" },
				terraform = { "terraform_fmt" },
				bash = { "shfmt" },
				rust = { "rustfmt" },
			},
			format_on_save = {
				async = false,
				timeout = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
