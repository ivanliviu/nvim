return {
	'akinsho/toggleterm.nvim',
	opts = {
		-- multiple terms?
		open_mapping = '<C-\\>', -- why not by default?
		size = vim.o.columns - (_G.arista and 94 or 89),
		autochdir = true,
		direction = 'vertical',
	},
}
