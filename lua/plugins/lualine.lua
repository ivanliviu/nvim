local colors = require 'core/palette'

local black = colors.gradient[1]
local white = colors.gradient[5]
local normal = colors.colors[1]
local insert = colors.colors[7]
local command = colors.colors[4]
local visual = colors.colors[10]
local replace = colors.colors[9]
local inactive = colors.gradient[2]

return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		options = {
			-- globalstatus = true,
			disabled_filetypes = { statusline = { 'no-neck-pain' } },
			theme = {
				normal = {
					a = { fg = black, bg = normal, gui = 'bold' },
					b = { fg = normal, bg = colors.gradient[2] },
					c = { fg = white, bg = black },
				},
				command = {
					a = { fg = black, bg = command, gui = 'bold' },
					b = { fg = command, bg = colors.gradient[2] },
				},
				visual = {
					a = { fg = black, bg = visual, gui = 'bold' },
					b = { fg = visual, bg = colors.gradient[2] },
				},
				inactive = {
					a = { fg = white, bg = inactive, gui = 'bold' },
					b = { fg = black, bg = white },
				},
				replace = {
					a = { fg = black, bg = replace, gui = 'bold' },
					b = { fg = replace, bg = colors.gradient[2] },
					c = { fg = white, bg = black },
				},
				insert = {
					a = { fg = black, bg = insert, gui = 'bold' },
					b = { fg = insert, bg = colors.gradient[2] },
					c = { fg = white, bg = black },
				},
			},
		},
		sections = {
			-- center buffer list, file name, etc?
			-- consider consistent spacing, like with location
			lualine_a = { 'mode' },
			lualine_b = { 'branch', 'diff', 'diagnostics' },
			-- _c has more priority than _b, _b content is not guaranteed
			lualine_c = { 'filename', 'filesize' },
			lualine_x = { 'searchcount', 'selectioncount', 'filetype' },
			lualine_y = { 'progress' },
			lualine_z = { '%4l:%-3v' },
		},
		tabline = {
			lualine_a = { 'buffers' },
			lualine_b = {},
			-- lualine_c = { '%=', 'buffers' },
			lualine_x = {},
			lualine_y = {},
			lualine_z = { 'tabs' },
		},
		winbar = {},
		extensions = { 'lazy', 'oil', 'quickfix', 'toggleterm' },
		-- look into nvim-dap-ui, overseer, trouble vs quickfix
		-- need solution for telescope and maybe other windows
	},
}
