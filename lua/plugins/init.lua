-- NOTE: learn Lazy, difference between update, sync, etc.

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	local out = vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'--branch=stable',
		lazyrepo,
		lazypath,
	}
	if vim.v.shell_error ~= 0 then
		error('Error cloning lazy.nvim:\n' .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
	rocks = { enabled = false },
	require 'plugins.auto_save',
	-- require 'plugins.avante',
	require 'plugins.bufdelete',
	require 'plugins.comment',
	require 'plugins.gitsigns',
	require 'plugins.no_neck_pain',
	require 'plugins.noice',
	require 'plugins.oil',
	require 'plugins.spider',
	require 'plugins.substitute',
	require 'plugins.todo_comments',
	require 'plugins.toggleterm',
	require 'plugins.web_devicons',
	----------------------------------------------------------------------------
	require 'plugins.autopairs',
	require 'plugins.cmp',
	require 'plugins.conform',
	require 'plugins.lazydev',
	require 'plugins.lspconfig',
	require 'plugins.lualine',
	require 'plugins.luvit_meta', -- as dependency of lsp?
	require 'plugins.mini', -- chosen...?
	require 'plugins.telescope',
	require 'plugins.treesitter',
	require 'plugins.workspaces',
	-- extras:
	require 'plugins.lint',
	require 'plugins.dap',
	'cbochs/grapple.nvim',
	{ import = 'plugins.theme' },
	not _G.arista and require 'plugins.trim' or nil,
}
