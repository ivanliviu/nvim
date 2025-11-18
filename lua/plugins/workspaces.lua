-- TODO: nvim <dir> => pwd = dir or something
-- TODO: (unrelated) create zsh shorcuts for Documents, sahbox, vin config, etc.
return {
	'natecraddock/workspaces.nvim', -- use open(_pre) hook to close current workspaces/buffers if needed
	opts = {
		mru_sort = false,
		auto_open = true,
		notify_info = false,
		-- option to automatically activate workspace when changing directory not via this plugin
		-- set to "autochdir" to enable auto_dir when using :e and vim.opt.autochdir
		-- valid options are false, true, and "autochdir"
		-- auto_dir = false|true|'autochdir'
		hooks = {
			open = {
				function()
					require('telescope.builtin').find_files()
				end,
			},
		},
		-- hooks = {
		-- 	open_pre = function() -- doesn't take effect
		-- 		vim.cmd 'enew'
		-- 		vim.cmd 'tabonly'
		-- 		vim.cmd 'only'
		-- 		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		-- 			if
		-- 				vim.api.nvim_buf_is_loaded(buf)
		-- 				and vim.bo[buf].buflisted
		-- 			then
		-- 				vim.cmd('bdelete! ' .. buf)
		-- 			end
		-- 		end
		-- 	end,
		-- },
	},
	config = function()
		local workspaces = require 'workspaces'
		-- workspaces.add('~/Documents/vault/git/vita', 'vita')
		-- workspaces.remove 'ki'
	end,
	-- write some autocmds for closing old buffers after switching workspace
}
