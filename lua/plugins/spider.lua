return {
	'chrisgrieser/nvim-spider',
	keys = (function()
		-- use this for mappings of other plugins
		-- if that's the case keymap functions are no longer required global
		-- learn all options for a lazy plugin entry
		local t, motions = {}, { 'w', 'e', 'b' }
		for _, m in ipairs(motions) do
			table.insert(t, {
				m,
				function()
					require('spider').motion(m)
				end,
				mode = { 'n', 'o', 'x' },
			})
		end
		return t
	end)(),
}
