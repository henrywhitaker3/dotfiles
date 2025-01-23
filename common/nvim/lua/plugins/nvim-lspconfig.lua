local config = function()
	local lspconfig = require("lspconfig")
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local capabilities = cmp_nvim_lsp.default_capabilities()

	local signs = { Error = "", Warn = "", Hint = "", Info = "" }

	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local on_attach = function(_, bufnr)
		local opts = { noremap = true, silent = true, buffer = bufnr }

		vim.keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)
		vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
		vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
		vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
		vim.keymap.set("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
		vim.keymap.set("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
		vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	end

	local lua = require("plugins.lsp.lua")
	lua.setup(on_attach, capabilities)

	local go = require("plugins.lsp.go")
	go.setup(on_attach, capabilities)

	local terraform = require("plugins.lsp.terraform")
	terraform.setup(on_attach, capabilities)

	local vue = require("plugins.lsp.volar")
	vue.setup(on_attach, capabilities)

	local typescript = require("plugins.lsp.typescript")
	typescript.setup(on_attach, capabilities)

	local yaml = require("plugins.lsp.yaml")
	yaml.setup(on_attach, capabilities)

	local sql = require("plugins.lsp.sql")
	sql.setup(on_attach, capabilities)

	local bash = require("plugins.lsp.bash")
	bash.setup(on_attach, capabilities)

	local json = require("plugins.lsp.json")
	json.setup(on_attach, capabilities)

	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"go",
			"terraform",
			"typescript",
			"javascript",
			"vue",
			"helm",
			"yaml",
			"sql",
			"mysql",
			"sh",
			"bash",
			"json",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = lua.lang,
				go = go.lang,
				terraform = terraform.lang,
				typescript = typescript.lang,
				vue = vue.lang,
				yaml = yaml.lang,
				helm = yaml.lang,
				sql = sql.lang,
				mysql = sql.lang,
				sh = bash.lang,
				bash = bash.lang,
				json = json.lang,
			},
		},
	})

	local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = lsp_fmt_group,
		callback = function()
			local efm
			if vim.lsp.get_clients then
				efm = vim.lsp.get_clients({ name = "efm" })
			else
				---@diagnostic disable-next-line: deprecated
				efm = vim.lsp.get_active_clients({ name = "efm" })
			end

			if vim.tbl_isempty(efm) then
				return
			end

			vim.lsp.buf.format({ name = "efm" })
		end,
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
		"hrsh7th/cmp-nvim-lsp",
		{
			"towolf/vim-helm",
			ft = "helm",
		},
	},
}
