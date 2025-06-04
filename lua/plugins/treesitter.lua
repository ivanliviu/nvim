-- NOTE: `help nvim-treesitter`
-- Other modules, e.g.:
-- `help nvim-treesitter-incremental-selection-mod`
-- show context: https://github.com/nvim-treesitter/nvim-treesitter-context
-- textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	main = 'nvim-treesitter.configs',
	opts = {
		ensure_installed = {
			'bash',
			'c',
			'diff',
			'html',
			'lua',
			'luadoc',
			'markdown',
			'markdown_inline',
			'query',
			'vim',
			'vimdoc',
		},
		auto_install = true, -- (other languages)
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { 'html' },
		},
		indent = { enable = true, disable = { 'html' } },
	},
}
