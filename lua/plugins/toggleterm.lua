-- TODO: multiple terms
-- TODO: bind terminal to its window / buffers always in window 1
return {
	'akinsho/toggleterm.nvim', -- fix size, again
	opts = {
		open_mapping = '<C-\\>', -- why not by default?
		persist_size = false,
		size = function() -- func better? when is it called? same for no-neck?
			return _G.arista and 94 or 89
		end,
		autochdir = true,
		direction = 'vertical',
	},
}
