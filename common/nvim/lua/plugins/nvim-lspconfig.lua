local config = function()
	require("lspconfig")
	local capabilities = require("blink.cmp").get_lsp_capabilities()

	local signs = { Error = "", Warn = "", Hint = "", Info = "" }

	local signConfig = {
		text = {},
		texthl = {},
		numhl = {},
	}

	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		signConfig.text[hl] = icon
		signConfig.texthl[hl] = hl
		signConfig.numhl[hl] = ""
	end

	local on_attach = function(client, bufnr)
		local opts = { noremap = true, silent = true, buffer = bufnr }

		if client.supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr })
		end

		vim.keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)
		vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
		vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga goto_definition<CR>", opts)
		vim.keymap.set("n", "<leader>sd", "<cmd>Lspsaga peek_definition<CR>", opts)
		vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
		vim.keymap.set("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
		vim.keymap.set("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
		vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	end

	local configs = vim.split(vim.fn.glob("~/.config/nvim/lua/config/lsp/*.lua"), "\n")
	for _, conf in pairs(configs) do
		local setup = require("config.lsp." .. vim.fs.basename(conf):gsub("%.lua", ""))
		local config = {
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = setup.filetypes,
		}
		if setup["config"] ~= nil then
			for key, val in pairs(setup.config) do
				config[key] = val
			end
		end
		vim.lsp.config(setup.server, config)
		vim.lsp.enable(setup.server)
	end

	vim.diagnostic.config({
		virtual_lines = true,
		signs = signConfig,
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		{
			"williamboman/mason.nvim",
			cmd = "Mason",
			event = { "BufReadPre", "BufNewFile" },
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
		},
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {
				ensure_installed = {
					"lua-language-server",
					"stylua",
					"luacheck",
					"gopls",
					"terraform-ls",
					"tflint",
					"vue_ls",
					"eslint_d",
					"ts_ls",
					"helm_ls",
					"yaml-language-server",
					"yamllint",
					"prettierd",
					"bash-language-server",
					"shellcheck",
					"shfmt",
					"jsonlint",
					"dockerfile-language-server",
					"goimports",
					"golangci-lint",
					"golines",
					"marksman",
					"markdownlint",
					"protols",
					"protolint",
					"htmlhint",
					"tailwindcss-language-server",
					"rustywind",
					"intelephense",
					"pyright",
					"black",
					"isort",
					"sleek",
					"nilaway",
					"hclfmt",
					"php-cs-fixer",
				},
			},
		},
		{
			"mason-org/mason-lspconfig.nvim",
			opts = {
				ensure_installed = {
					"lua_ls",
					"yamlls",
					"helm_ls",
					"jsonls",
					"gopls",
					"vue_ls",
					"ts_ls",
					"bashls",
					"terraformls",
					"marksman",
					"rust_analyzer",
					"tailwindcss",
				},
				automatic_installation = true,
			},
			event = "BufReadPre",
		},
	},
}
