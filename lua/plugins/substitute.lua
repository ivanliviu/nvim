return {
	'gbprod/substitute.nvim',
	config = function()
		local substitute = require 'substitute'
		substitute.setup()
		Map_leader('s', substitute.operator)
		Map_leader('ss', substitute.line)
		Map_leader('S', substitute.eol)
		Map_leader('s', substitute.visual, 'x')
	end,
}
