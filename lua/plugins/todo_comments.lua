local palette = require 'core.palette'

return {
	'folke/todo-comments.nvim',
	-- TODO: sign_priority, other settings
	event = 'VeryLazy',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {
		keywords = {
			FIX = { icon = '❌', color = palette.red },
			HACK = { icon = '🔥', color = palette.orange },
			NOTE = { icon = '🗒️', color = palette.chartreuse },
			PERF = { icon = '⏩', color = palette.cyan },
			TEST = { icon = '🧪', color = palette.green },
			TODO = { icon = '📝', color = palette.blue },
			WARN = { icon = '⚠️', color = palette.yellow },
		},
	},
	config = function(_, opts)
		require('todo-comments').setup(opts)
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
