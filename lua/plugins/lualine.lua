local colors = require 'core/palette'

return {
	-- shows number of characters instead of number of columns
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		options = {
			globalstatus = true,
			theme = {
				normal = {
					a = { fg = colors.black, bg = colors.purple, gui = 'bold' },
					b = { fg = colors.purple, bg = colors.black },
					c = { fg = colors.white, bg = colors.black },
				},
				command = {
					a = { fg = colors.black, bg = colors.cyan, gui = 'bold' },
					b = { fg = colors.cyan, bg = colors.black },
				},
				visual = {
					a = { fg = colors.black, bg = colors.pink, gui = 'bold' },
					b = { fg = colors.pink, bg = colors.black },
				},
				inactive = {
					a = { fg = colors.white, bg = colors.visual, gui = 'bold' },
					b = { fg = colors.black, bg = colors.white },
				},
				replace = {
					a = { fg = colors.black, bg = colors.yellow, gui = 'bold' },
					b = { fg = colors.yellow, bg = colors.black },
					c = { fg = colors.white, bg = colors.black },
				},
				insert = {
					a = { fg = colors.black, bg = colors.green, gui = 'bold' },
					b = { fg = colors.green, bg = colors.black },
					c = { fg = colors.white, bg = colors.black },
				},
			},
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
