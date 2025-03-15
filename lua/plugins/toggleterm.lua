return {
	'akinsho/toggleterm.nvim', -- fix size, again
	opts = {
		-- multiple terms?
		open_mapping = '<C-\\>', -- why not by default?
		persist_size = false,
		size = function() -- func better? when is it called? same for no-neck?
			return _G.arista and 94 or 89
		end,
		autochdir = true,
		direction = 'vertical',
	},
}
