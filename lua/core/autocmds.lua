vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

----------------------------------------------------------------------------------------

vim.api.nvim_create_autocmd('VimEnter', {
	callback = function()
		-- Set the working directory based on the opened file or directory
		if vim.fn.argc() > 0 then
			local arg = vim.fn.argv(0)
			if arg ~= '' then
				local path = vim.fn.fnamemodify(arg, ':p')
				local stat = vim.loop.fs_stat(path)
				if stat then
					if stat.type == 'directory' then
						vim.api.nvim_set_current_dir(path)
					elseif stat.type == 'file' then
						local file_dir = vim.fn.fnamemodify(path, ':p:h')
						vim.api.nvim_set_current_dir(file_dir)
					end
				end
			end
		end
		-- Defer opening nvim-tree to ensure the file buffer is loaded
		vim.schedule(function()
			require('nvim-tree.api').tree.open()
			vim.cmd 'wincmd p' -- Ensure the focus is on the file buffer
		end)
	end,
})

vim.api.nvim_create_autocmd('VimResized', {
	-- group = 'AutoCloseNvimTreeOnResize',
	callback = function()
		-- if pcall(vim.cmd, 'NvimTreeFindFile') then
		if vim.o.columns < 125 then
			vim.cmd 'NvimTreeClose' -- no braces?
		else
			vim.cmd 'NvimTreeOpen'
		end
		-- end
	end,
})

-- fix for whatever makes these not work on dir -> file
vim.api.nvim_create_autocmd('BufWinEnter', {
	pattern = '*',
	callback = function()
		if vim.bo.buftype == '' then
			vim.opt.cc = '89'
			vim.opt.list = true
			vim.opt.nu = true
			vim.opt.rnu = true
			vim.opt.wrap = true
			vim.opt.sts = 4
			vim.opt.sw = 4
			vim.opt.ts = 4
		end
	end,
})

-- Arista
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
	pattern = { '*.tac', '*.tin', '*.itin', '*.arx' },
	command = 'setfiletype cpp',
})
