local config = function()
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
		setup.setup(on_attach, capabilities)
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
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			opts = {
				fast_wrap = {},
				disable_filetype = { "TelescopePrompt", "vim" },
				inlay_hints = { enabled = true },
			},
		},
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
					"volar",
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
					"phpcs",
					"python-lsp-server",
					"black",
					"isort",
					"harper-ls",
					"sleek",
				},
			},
		},
		{
			"williamboman/mason-lspconfig.nvim",
			opts = {
				ensure_installed = {
					"lua_ls",
					"yamlls",
					"helm_ls",
					"jsonls",
					"gopls",
					"volar",
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
