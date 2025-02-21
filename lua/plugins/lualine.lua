return {
	-- shows number of characters instead of number of columns
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		options = {
			globalstatus = true,
			theme = 'dracula-nvim',
		},
		sections = {
			lualine_x = { 'filetype' },
		},
		tabline = {
			lualine_a = { 'buffers' },
			lualine_z = { 'tabs' },
		},
		winbar = {},
		extensions = { 'lazy', 'oil', 'quickfix', 'toggleterm' },
		-- look into nvim-dap-ui, overseer, trouble vs quickfix
		-- need solution for telescope and maybe other windows
	},
}
