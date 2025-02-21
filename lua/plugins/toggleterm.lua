return {
	'akinsho/toggleterm.nvim',
	opts = {
		-- multiple terms?
		open_mapping = '<C-\\>', -- why not by default?
		size = function()
			return vim.o.columns - (_G.arista and 92 or 87) -- as function? why 87 (88 in nnp)
		end,
		autochdir = true,
		direction = 'vertical',
	},
}
