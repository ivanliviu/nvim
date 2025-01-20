local function map(key, value, mode, opts)
	vim.keymap.set(
		mode or 'n',
		key,
		value,
		vim.tbl_extend('force', { silent = true }, opts or {})
	)
end

map('<Esc><Esc>', '<C-\\><C-n>', 't')
for _, key in ipairs { 'C', 'S', 'X', 'c', 's', 'x' } do
	map(key, '"_' .. key)
end

local function map_cmd(key, value, mode, opts)
	map(key, '<cmd>' .. value .. '<CR>', mode, opts)
end

map_cmd('<C-h>', 'che')
map_cmd('<Esc>', 'noh')
map_cmd('<S-Tab>', 'bp')
map_cmd('<Tab>', 'bn')
map_cmd('Q', 'qa')

local function map_expr(key, value, mode)
	map(key, value, mode, { expr = true })
end

map_expr('j', "v:count == 0 ? 'gj' : 'j'", { 'n', 'v' })
map_expr('k', "v:count == 0 ? 'gk' : 'k'", { 'n', 'v' })

local function map_leader(key, value, mode)
	map('<leader>' .. key, value, mode)
end

map_leader('d', vim.diagnostic.setloclist)
for _, key in ipairs { 'h', 'j', 'k', 'l' } do
	map_leader(key, '<C-w>' .. key)
end

local function map_leader_cmd(key, value, mode)
	map_cmd('<leader>' .. key, value, mode)
end

map_leader_cmd('<Tab>', 'b#')
map_leader_cmd('q', 'clo')

----------------------------------------------------------------------------------------

map_leader_cmd('w', 'Bdelete')
map_leader_cmd('r', 'BufferRestore')

map_leader('p', ':!python<Space>')

return map_leader
