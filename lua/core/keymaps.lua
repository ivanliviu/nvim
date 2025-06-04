-- TODO: map space to nothing in normal, visual, etc.
-- TODO: :checkhealth mapping, use and fix
-- TODO: keymap for o/O<Esc>?
-- TODO: remap unused keybinds [a-z]->[A-Z]-><C-[a-z]>
-- TODO: `:Telescope help_tags` `:help vim.opt` `:help option-list` `:help vim.keymap.set()` `:help lua-guide-autocommands` `:help` `<leader>sh <e.g lazy.nvim-plugin>`

function Map(key, value, mode, opts)
	vim.keymap.set(
		mode or 'n',
		key,
		value,
		vim.tbl_extend('force', { silent = true }, opts or {})
	)
end

function Map_cmd(key, value, mode, opts)
	Map(key, '<cmd>' .. value .. '<CR>', mode, opts)
end

function Map_expr(key, value, mode)
	Map(key, value, mode, { expr = true })
end

function Map_leader(key, value, mode)
	Map('<leader>' .. key, value, mode)
end

function Map_leader_cmd(key, value, mode)
	Map_cmd('<leader>' .. key, value, mode)
end

Map('<Esc><Esc>', '<C-\\><C-n>', 't')
for _, key in ipairs { 'C', 'S', 'X', 'c', 's', 'x' } do
	Map(key, '"_' .. key)
end

Map_cmd('<C-h>', 'che')
Map_cmd('<Esc>', 'noh')
Map_cmd('<S-Tab>', 'bp')
Map_cmd('<Tab>', 'bn')
Map_cmd('Q', 'qa')

Map_expr('j', "v:count == 0 ? 'gj' : 'j'", { 'n', 'v' })
Map_expr('k', "v:count == 0 ? 'gk' : 'k'", { 'n', 'v' })

Map_leader('d', vim.diagnostic.setloclist)
for _, key in ipairs { 'h', 'j', 'k', 'l' } do
	Map_leader(key, '<C-w>' .. key)
end

Map_leader_cmd('<Tab>', 'b#')
Map_leader_cmd('q', 'clo')
Map_leader_cmd('w', 'Bdelete')

local main_tab = nil
local second_tab = nil

local function toggle_tabs()
	local current_tab = vim.api.nvim_get_current_tabpage()

	-- On first run, record your current tab as the “main” tab
	if not main_tab then
		main_tab = current_tab
	end

	-- If we're currently on the two-buffer tab, switch back
	if current_tab == second_tab then
		vim.api.nvim_set_current_tabpage(main_tab)
		return
	end

	-- Otherwise, go to or create the second tab
	if not second_tab or not vim.api.nvim_tabpage_is_valid(second_tab) then
		-- Get at least two existing/loaded buffers
		local bufs = vim.fn.getbufinfo { buflisted = 1 }
		if #bufs < 2 then
			print 'Need at least two loaded buffers to split.'
			return
		end

		-- Create a new tab from the current window's buffer (no empty buffer)
		vim.cmd 'tab split'
		second_tab = vim.api.nvim_get_current_tabpage()

		-- Left window: first buffer in list
		vim.cmd('buffer ' .. bufs[1].bufnr)

		-- Right window: second buffer in list
		vim.cmd 'vsplit'
		vim.cmd('buffer ' .. bufs[2].bufnr)
	end

	-- Switch to the two-buffer tab
	vim.api.nvim_set_current_tabpage(second_tab)
end

Map_leader('t', toggle_tabs)
