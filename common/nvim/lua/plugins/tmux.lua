return {
	"christoomey/vim-tmux-navigator",
	lazy = false,
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
		"TmuxNavigatorProcessList",
	},
	keys = {
		{ "n", "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
		{ "n", "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
		{ "n", "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
		{ "n", "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
		{ "n", "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
	},
}
