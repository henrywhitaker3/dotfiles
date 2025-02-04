return {
	"akinsho/toggleterm.nvim",
	config = function()
		local key = "<C-`>"
		if os.getenv("WSL_DISTRO_NAME") ~= nil then
			key = "<leader>tt"
		end
		require("toggleterm").setup({
			open_mapping = key,
			size = 20,
		})
	end,
}
