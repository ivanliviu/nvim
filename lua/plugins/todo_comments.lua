return {
	'folke/todo-comments.nvim', -- TODO: replace TODO file
	-- TODO: sign_priority
	-- FIX:
	-- HACK:
	-- WARN:
	-- PERF: (performance)
	-- NOTE:
	-- TEST:
	event = 'VimEnter',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {},
	config = function()
		require('todo-comments').setup()
		vim.keymap.set('n', ']t', function()
			require('todo-comments').jump_next()
		end, { desc = 'Next todo comment' })

		vim.keymap.set('n', '[t', function()
			require('todo-comments').jump_prev()
		end, { desc = 'Previous todo comment' })
	end,
}

-- TODO:
-- :TodoTelescope [cwd=~/projects/foobar] [keywords=TODO,FIX]
-- :Trouble todo [filter = {tag = {TODO,FIX,FIXME}}] (trouble.nvim)
-- :TodoLocList (uses the location list)
-- :TodoQuickFix (uses the quickfix list)
