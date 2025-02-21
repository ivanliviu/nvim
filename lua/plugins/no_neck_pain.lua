return {
	'shortcuts/no-neck-pain.nvim',
	config = true,
	opts = {
		-- 80 + extra, TODO: fix 79 for 1000+ line docs as function?
		width = _G.arista and 93 or 88,
		autocmds = {
			enableOnVimEnter = true,
			skipEnteringNoNeckPainBuffer = true,
			-- better (than skip), use mapping to toggle to diff/terminal
		},
	},
}
