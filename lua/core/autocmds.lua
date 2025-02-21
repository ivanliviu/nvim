vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup(
		'kickstart-highlight-yank',
		{ clear = true }
	),
	callback = function()
		vim.highlight.on_yank()
	end,
})

if _G.arista then
	vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
		pattern = { '*.tac', '*.tin', '*.itin', '*.arx' },
		command = 'setfiletype cpp',
	})
end
