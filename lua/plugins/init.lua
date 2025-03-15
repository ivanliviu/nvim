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
	require 'plugins.comment',
	require 'plugins.gitsigns',
	require 'plugins.no_neck_pain',
	require 'plugins.oil',
	require 'plugins.spider',
	require 'plugins.substitute',
	require 'plugins.todo_comments',
	require 'plugins.toggleterm',
	require 'plugins.web_devicons',
	----------------------------------------------------------------------------
	require 'plugins.autopairs',
	require 'plugins.lualine',
	require 'plugins.workspaces',
	require 'plugins.telescope',
	-- LSP (sort?):
	require 'plugins.luvit_meta', -- as dependency of lsp?
	require 'plugins.lazydev',
	require 'plugins.lspconfig',
	require 'plugins.conform',
	require 'plugins.cmp',
	require 'plugins.mini', -- chosen...?
	require 'plugins.treesitter',
	{
		'folke/noice.nvim',
		event = 'VeryLazy',
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			'MunifTanjim/nui.nvim',
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			'rcarriga/nvim-notify',
		},
		config = function()
			require('noice').setup {
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						['vim.lsp.util.convert_input_to_markdown_lines'] = true,
						['vim.lsp.util.stylize_markdown'] = true,
						['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			}
		end,
	},
	not _G.arista and require 'plugins.trim' or nil,
	-- TODO: 'github/copilot.vim'
}
