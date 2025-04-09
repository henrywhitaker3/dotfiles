local filetypes = { "go", "gomod", "gowork", "gotempl" }

local setup = function(on_attach, capabilites)
	local util = require("lspconfig/util")

	require("lspconfig").gopls.setup({
		on_attach = on_attach,
		capabilites = capabilites,
		cmd = { "gopls" },
		filetypes = filetypes,
		root_dir = util.root_pattern("go.work", "go.mod", ".git"),
		settings = {
			gopls = {
				completeUnimported = true,
				staticcheck = true,
				analyses = {
					unusedparams = true,
					nilness = true,
				},
			},
		},
	})

	local function get_offset_encoding(buf)
		local client = vim.lsp.get_clients({ bufnr = buf })[1]
		return client and client.offset_encoding or "utf-16"
	end

	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*.go",
		callback = function(args)
			local params = vim.lsp.util.make_range_params(0, get_offset_encoding(args.buf))
			-- params.context = { only = { "source.organizeImports" } }
			-- buf_request_sync defaults to a 1000ms timeout. Depending on your
			-- machine and codebase, you may want longer. Add an additional
			-- argument after params if you find that you have to write the file
			-- twice for changes to be saved.
			-- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
			local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
			for cid, res in pairs(result or {}) do
				for _, r in pairs(res.result or {}) do
					if r.edit then
						local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
						vim.lsp.util.apply_workspace_edit(r.edit, enc)
					end
				end
			end
			vim.lsp.buf.format({ async = false })
		end,
	})
end

return {
	setup = setup,
	filetypes = filetypes,
}
