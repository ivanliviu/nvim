------------------------------------------------------------------------------80

return {
	'shortcuts/no-neck-pain.nvim',
	config = true,
	opts = { -- buggy width with vsplit, toggleterm opens right of right buffer
		minSideBufferWidth = 5,
		width = _G.arista and 94 or 89,
		autocmds = {
			enableOnVimEnter = true,
			skipEnteringNoNeckPainBuffer = true,
			-- better (than skip), use mapping to toggle to diff/terminal
		},
	},
}

-- FIX: this work for keeping window size fixed but destroys toggleterm
-- TODO: maybe just clone NNP and change internal logic?

-- return {
-- 	'shortcuts/no-neck-pain.nvim',
--
-- 	config = function()
-- 		local TARGET, MINPAD = (_G.arista and 95 or 90), 5
-- 		local nnp = require 'no-neck-pain'
--
-- 		-- 1. Standard setup
-- 		nnp.setup {
-- 			width = TARGET,
-- 			minSideBufferWidth = MINPAD,
-- 			buffers = { wo = { winfixwidth = true } },
-- 			autocmds = {
-- 				enableOnVimEnter = true,
-- 				skipEnteringNoNeckPainBuffer = true,
-- 			},
-- 		}
--
-- 		-- 2. Give the odd spare column to the right pad
-- 		local ui, base =
-- 			require 'no-neck-pain.ui', require('no-neck-pain.ui').get_side_width
-- 		ui.get_side_width = function(side)
-- 			local w = base(side) -- plugin’s own calculation
-- 			if w == 0 then
-- 				return 0
-- 			end -- tiny screens → bail
-- 			local spare = vim.o.columns - (TARGET + 2 * w) -- −1, 0 or +1
-- 			if side == 'right' then
-- 				w = w + spare
-- 			end -- asym-pad on the right
-- 			return w
-- 		end
--
-- 		vim.api.nvim_create_autocmd('VimResized', {
-- 			callback = function()
-- 				nnp.resize(TARGET)
-- 			end, -- re-apply on every OS resize
-- 		})
-- 	end,
-- }
