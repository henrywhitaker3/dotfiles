return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofmt", "goimports", "golines" },
				yaml = { "prettierd" },
				helm = { "prettierd" },
				json = { "prettierd" },
				typescript = { "eslint_d" },
				vue = { "eslint_d", "rustywind" },
				javascript = { "eslint_d" },
				terraform = { "terraform_fmt" },
				bash = { "shfmt" },
				rust = { "rustfmt" },
				html = { "prettierd", "rustywind" },
				gleam = { "gleam" },
				python = { "black", "isort" },
				sql = { "sleek" },
				hcl = { "hcl" },
			},
			format_on_save = {
				async = false,
				timeout = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
