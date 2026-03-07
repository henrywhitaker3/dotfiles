local theme = {
	dark = "catppuccin-mocha",
	light = "catppuccin-latte",
}

local toggle = function()
	local cases = {}
	cases[theme.dark] = theme.light
	cases[theme.light] = theme.dark
	cases["default"] = theme.dark

	local current = vim.g.colors_name
	if current == nil then
		current = "default"
	end

	vim.cmd("colorscheme " .. cases[current])
end

return {
	"catppuccin/nvim",
	lazy = false,
	priority = 999,
	opts = {
		auto_integrations = true,
		color_overrides = {
			mocha = {
				pink = "#CBA6F7",
				mauve = "#FAA7E6",
			},
		},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		toggle()
		vim.keymap.set("n", "<leader>ct", toggle, { noremap = true, silent = true })
	end,
}
