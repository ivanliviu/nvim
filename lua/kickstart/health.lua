return {
	check = function()
		vim.health.start 'kickstart.nvim'

		vim.health.info [[NOTE: Not every warning is a 'must-fix' in `:checkhealth`
			Fix only warnings for plugins and languages you intend to use.
			Mason will give warnings for languages that are not installed.
			You do not need to install, unless you want to use those languages!]]

		local uv = vim.uv or vim.loop
		vim.health.info('System Information: ' .. vim.inspect(uv.os_uname()))
	end,
}
