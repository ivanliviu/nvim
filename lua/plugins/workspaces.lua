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
			open_pre = function() -- doesn't take effect
				vim.cmd 'enew'
				vim.cmd 'tabonly'
				vim.cmd 'only'
				for _, buf in ipairs(vim.api.nvim_list_bufs()) do
					if
						vim.api.nvim_buf_is_loaded(buf)
						and vim.bo[buf].buflisted
					then
						vim.cmd('bdelete! ' .. buf)
					end
				end
			end,
		},
	},
	config = function()
		-- local workspaces = require 'workspaces'
		-- workspaces.add('~/Documents', 'home')
		-- workspaces.add('~/Documents/vault/git/neovim', 'neovim')
		-- workspaces.add('~/Documents/vault/git/sah', 'sah')
		-- workspaces.add('~/Documents/vault/git/sahbox', 'sahbox')
		-- workspaces.add('~/Documents/vault/git/toolkit', 'toolkit')
	end,
	-- write some autocmds for closing old buffers after switching workspace
}
