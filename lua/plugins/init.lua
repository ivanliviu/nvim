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
	require 'plugins.auto_save',
	require 'plugins.bufdelete',
	require 'plugins.colorizer',
	require 'plugins.comment',
	require 'plugins.gitsigns',
	require 'plugins.no_neck_pain',
	require 'plugins.oil',
	require 'plugins.spider',
	require 'plugins.substitute',
	require 'plugins.toggleterm',
	require 'plugins.web_devicons',
	----------------------------------------------------------------------------
	require 'plugins.autopairs',
	require 'plugins.lualine',
	require 'plugins.todo_comments',
	require 'plugins.workspaces',
	require 'plugins.telescope',
	-- 'github/copilot.vim'
	-- LSP (can sort? then remove chosen):
	require 'plugins.luvit_meta', -- as dependency of lsp?
	require 'plugins.lazydev',
	require 'plugins.lspconfig', -- chosen
	require 'plugins.conform', -- chosen
	require 'plugins.cmp', -- chosen
	require 'plugins.mini', -- chosen...
	require 'plugins.treesitter', -- chosen
	'rcarriga/nvim-notify',
	not _G.arista and require 'plugins.trim' or nil,
}
