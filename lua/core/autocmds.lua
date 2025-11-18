-- TODO:
-- make it possible to show at least the function that includes the current line
-- no "special" buffers in file windows, no file buffers in "special" windows
-- i.e. special windows really shouldn't be able to Tab to a different buffer
-- mappings should run in the window where they're relevant

vim.api.nvim_create_autocmd('TextYankPost', {
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
