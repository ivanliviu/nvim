------------------------------------------------------------------------------80
return {
	'shortcuts/no-neck-pain.nvim',
	config = true,
	opts = { -- buggy width with vsplit, toggleterm opens right of right buffer
		minSideBufferWidth = 1, -- TODO: temp
		width = _G.arista and 94 or 89,
		autocmds = {
			enableOnVimEnter = true,
			skipEnteringNoNeckPainBuffer = true,
			-- better (than skip), use mapping to toggle to diff/terminal
		},
	},
}
