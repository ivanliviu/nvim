vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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

require 'core.options'
map_leader = require 'core.keymaps' -- fix
require 'core.autocmds'

require 'plugins'

----------------------------------------------------------------------------------------

local substitute = require 'substitute'
substitute.setup()
map_leader('s', substitute.operator)
map_leader('ss', substitute.line)
map_leader('S', substitute.eol)
map_leader('s', substitute.visual, 'x')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
