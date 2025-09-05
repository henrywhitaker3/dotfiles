return {
	"mfussenegger/nvim-lint",
	dependencies = {
		"neovim/nvim-lspconfig",
		{
			"towolf/vim-helm",
			ft = "helm",
		},
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		local yamllint = lint.linters.yamllint
		yamllint.args = {
			{ "-f", "parsable", "-d", '"{extends: default, rules: {line-length: disable}}"', "-" },
		}

		lint.linters_by_ft = {
			bash = { "shellcheck" },
			docker = { "hadolint" },
			go = { "golangcilint" },
			json = { "jsonlint" },
			lua = { "luacheck" },
			typescript = { "eslint_d" },
			javascript = { "eslint_d" },
			vue = { "eslint_d" },
			yaml = { "yamllint" },
			helm = { "yamllint" },
			markdown = { "markdownlint" },
			proto = { "protolint" },
			html = { "htmlhint" },
			php = { "php" },
			terraform = { "tflint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
