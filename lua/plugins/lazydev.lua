return {
	'folke/lazydev.nvim', -- Lua LSP
	ft = 'lua',
	opts = {
		library = {
			{ path = 'luvit-meta/library', words = { 'vim%.uv' } },
		},
	},
}
