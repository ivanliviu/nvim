return {
	-- adjust plugin, minimize config
	'ivanliviu/dracula', -- rename repo to dracula.nvim?
	priority = 1000, -- load this before all the other start plugins? what about lazy order? if both used, use priority
	-- what should the value be anyway? what's the default?
	name = 'dracula', -- needed?
	config = function()
		vim.cmd.colorscheme 'dracula'
		-- to import colors: local colors = require('dracula').colors()
		-- better than using hardcoded values wherever
	end,
}
