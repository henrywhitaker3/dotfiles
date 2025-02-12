return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local theme = require("lualine.themes.nord")
		theme.normal.c.bg = nil
		local blame = require("gitblame")

		require("lualine").setup({
			options = {
				theme = theme,
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diagnostics" },
				lualine_c = {
					"filename",
					{ blame.get_current_blame_text, cond = blame.is_blame_text_available },
				},
				lualine_x = { "encoding", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
