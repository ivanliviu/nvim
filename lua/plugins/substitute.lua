-- TODO: review chatgpt code:
return {
	'gbprod/substitute.nvim',
	config = function()
		local substitute = require 'substitute'
		substitute.setup()

		local function trim_reg(reg)
			reg = (reg ~= '' and reg) or '"'
			local info = vim.fn.getreginfo(reg)
			for i, line in ipairs(info.regcontents) do
				info.regcontents[i] = line:gsub('%s+$', '')
			end
			if info.regcontents[#info.regcontents] == '' then
				table.remove(info.regcontents)
			end
			vim.fn.setreg(reg, info.regcontents, info.regtype)
		end

		-- factory: wrap any fn so it trims then calls the original
		local function wrap(fn) -- better name
			return function(...) -- why ...?
				trim_reg(vim.v.register)
				return fn(...)
			end
		end

		-- your original Map_leader calls, now wrapping each substitute.* fn
		Map_leader('s', wrap(substitute.operator))
		Map_leader('ss', wrap(substitute.line))
		Map_leader('S', wrap(substitute.eol))
		Map_leader('s', wrap(substitute.visual), 'x')
	end,
}
