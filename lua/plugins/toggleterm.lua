return {
	'akinsho/toggleterm.nvim',
	opts = {
		-- multiple terms?
		open_mapping = '<C-\\>', -- why not by default?
		persist_size = false,
		size = function()
			local size = vim.o.columns - (_G.arista and 94 or 89)
			if size < 32 then
				return 32 -- better max(a, b) impl -- func better? log calls
			end
			return size
		end,
		autochdir = true,
		direction = 'vertical',
	},
}
