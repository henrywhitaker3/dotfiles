return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
		vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
		vim.keymap.set('n', '<C-p>', builtin.git_files, {})
		vim.keymap.set('n', '<leader>gs', "<cmd>Telescope git_status<CR>", {})
		vim.keymap.set('n', '<leader>gcm', "<cmd>Telescope git_commits<CR>", {})
	end
}
