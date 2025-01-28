local config = function()
	local lspconfig = require("lspconfig")
	local capabilities = require("blink.cmp").get_lsp_capabilities()

	local signs = { Error = "", Warn = "", Hint = "", Info = "" }

	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local on_attach = function(_, bufnr)
		local opts = { noremap = true, silent = true, buffer = bufnr }

		vim.keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)
		vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
		vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga goto_definition<CR>", opts)
		vim.keymap.set("n", "<leader>sd", "<cmd>Lspsaga peek_definition<CR>", opts)
		vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
		vim.keymap.set("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
		vim.keymap.set("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
		vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	end

	local filetypes = {}
	local langs = {}
	local configs = vim.split(vim.fn.glob("~/.config/nvim/lua/config/lsp/*.lua"), "\n")
	for _, conf in pairs(configs) do
		local setup = require("config.lsp." .. vim.fs.basename(conf):gsub("%.lua", ""))
		setup.setup(on_attach, capabilities)
		if setup["efm"] ~= nil then
			for _, efm in pairs(setup.efm) do
				langs[efm] = setup.lang
			end
		end
		if setup["filetypes"] then
			for _, ft in pairs(setup.filetypes) do
				if filetypes[ft] == nil then
					table.insert(filetypes, ft)
				end
			end
		end
	end

	lspconfig.efm.setup({
		filetypes = filetypes,
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = langs,
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
		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			opts = {
				fast_wrap = {},
				disable_filetype = { "TelescopePrompt", "vim" },
			},
		},
		{
			"williamboman/mason.nvim",
			cmd = "Mason",
			event = "BufReadPre",
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
					"efm",
					"lua-language-server",
					"stylua",
					"luacheck",
					"gopls",
					"terraform-ls",
					"volar",
					"eslint_d",
					"ts_ls",
					"helm_ls",
					"yaml-language-server",
					"yamllint",
					"prettier",
					"sqlls",
					"sqlfluff",
					"bash-language-server",
					"shellcheck",
					"shfmt",
					"jsonlint",
					"dockerfile-language-server",
				},
			},
		},
		{
			"williamboman/mason-lspconfig.nvim",
			opts = {
				ensure_installed = {
					"efm",
					"lua_ls",
					"yamlls",
					"helm_ls",
					"jsonls",
					"gopls",
					"volar",
					"sqlls",
					"ts_ls",
					"bashls",
					"terraformls",
				},
				automatic_installation = true,
			},
			event = "BufReadPre",
		},
		"creativenull/efmls-configs-nvim",
		{
			"towolf/vim-helm",
			ft = "helm",
		},
	},
}
