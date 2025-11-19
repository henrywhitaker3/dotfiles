return {
	{
		"nvim-mini/mini.nvim",
		version = false,
		config = function()
			require("mini.ai").setup()
			require("mini.comment").setup()
			require("mini.pairs").setup()
			require("mini.trailspace").setup()
			require("mini.icons").setup()
		end,
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},
}
