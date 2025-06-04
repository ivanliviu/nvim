vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup(
		'kickstart-highlight-yank',
		{ clear = true }
	),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- TODO: be an order of operation issue
vim.api.nvim_create_autocmd({ 'BufWinEnter', 'WinEnter' }, {
	pattern = { 'no-neck-pain*' },
	callback = function()
		vim.wo.statusline = ''
		vim.wo.winbar = ''
	end,
})

if _G.arista then
	vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
		pattern = { '*.tac', '*.tin', '*.itin', '*.arx' },
		command = 'setfiletype cpp',
	})
end
