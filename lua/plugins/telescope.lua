-- TODO: search should include . files, maybe not build etc.
-- TODO: learn bulk find, replace, edit, quickfix lists, etc.

local extensions = { 'py', 'lua', 'rs', 'md', 'cpp', 'hpp', 'txt' }
local function rg_find_cmd(exts)
	-- PERF: vs ripgrep
	local brace = '*.{' .. table.concat(exts, ',') .. '}'
	return { 'rg', '--files', '--glob', brace }
end
-- local function fd_find_cmd(exts)
--  -- FIX: no results
-- 	local cmd = { 'fd', '--type', 'f' } -- you can add '--hidden' here if you want
-- 	for _, ext in ipairs(exts) do
-- 		table.insert(cmd, '--extension')
-- 		table.insert(cmd, ext)
-- 	end
-- 	return cmd
-- end
local function extensions_glob(exts)
	return '*.{' .. table.concat(exts, ',') .. '}'
end

return {
	'nvim-telescope/telescope.nvim',
	event = 'VimEnter',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
			'nvim-telescope/telescope-fzf-native.nvim',

			-- `build` is used to run some command when the plugin is installed/updated.
			-- This is only run then, not every time Neovim starts up.
			build = 'make',

			-- `cond` is a condition used to determine whether this plugin should be
			-- installed and loaded.
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
		},
		{ 'nvim-telescope/telescope-ui-select.nvim' },
	},
	config = function()
		-- important keymaps: - Insert mode: <c-/> - Normal mode: ?
		--
		-- This opens a window that shows you all of the keymaps for the current
		-- Telescope picker. This is really useful to discover what Telescope can
		-- do as well as how to actually do it!

		-- [[ Configure Telescope ]]
		-- See `:help telescope` and `:help telescope.setup()`
		require('telescope').setup {
			-- You can put your default mappings / updates / etc. in here
			--	All the info you're looking for is in `:help telescope.setup()`
			--
			-- defaults = {
			--	 mappings = {
			--		 i = { ['<c-enter>'] = 'to_fuzzy_refine' },
			--	 },
			-- },
			-- pickers = {}
			extensions = {
				['ui-select'] = {
					require('telescope.themes').get_dropdown(),
				},
			},
		}

		-- Enable Telescope extensions if they are installed
		pcall(require('telescope').load_extension, 'fzf')
		pcall(require('telescope').load_extension, 'ui-select')

		-- See `:help telescope.builtin`
		local builtin = require 'telescope.builtin'
		vim.keymap.set(
			'n',
			'<leader>sh',
			builtin.help_tags,
			{ desc = '[S]earch [H]elp' }
		)
		vim.keymap.set(
			'n',
			'<leader>sk',
			builtin.keymaps,
			{ desc = '[S]earch [K]eymaps' }
		)
		-- FIX: fullscreening with this open causes error
		vim.keymap.set('n', '<leader>sf', function()
			require('telescope.builtin').find_files {
				hidden = true,
				find_command = rg_find_cmd(extensions),
			}
		end)
		-- vim.keymap.set(
		-- 	'n',
		-- 	'<leader>ss', -- FIX: this shadows substituting a row
		-- 	builtin.builtin,
		-- 	{ desc = '[S]earch [S]elect Telescope' }
		-- )
		vim.keymap.set(
			'n',
			'<leader>sw',
			builtin.grep_string,
			{ desc = '[S]earch current [W]ord' }
		)
		vim.keymap.set('n', '<leader>sg', function()
			builtin.live_grep {
				additional_args = function(_)
					return { '--glob', extensions_glob(extensions) }
				end,
			}
		end)
		vim.keymap.set(
			'n',
			'<leader>sd',
			builtin.diagnostics,
			{ desc = '[S]earch [D]iagnostics' }
		)
		vim.keymap.set(
			'n',
			'<leader>sr',
			builtin.resume,
			{ desc = '[S]earch [R]esume' }
		)
		vim.keymap.set(
			'n',
			'<leader>sp',
			'<cmd>Telescope workspaces<CR>', -- TODO
			{ desc = '[S]earch [P]roject' }
		)
		vim.keymap.set(
			'n',
			'<leader>s.',
			builtin.oldfiles,
			{ desc = '[S]earch Recent Files ("." for repeat)' }
		)
		vim.keymap.set('n', '<leader><leader>', builtin.buffers)

		-- Slightly advanced example of overriding default behavior and theme
		vim.keymap.set('n', '<leader>/', function()
			-- You can pass additional configuration to Telescope to change the theme, layout, etc.
			builtin.current_buffer_fuzzy_find(
				require('telescope.themes').get_dropdown {
					winblend = 10,
					previewer = false,
				}
			)
		end, { desc = '[/] Fuzzily search in current buffer' })

		-- It's also possible to pass additional configuration options.
		--	See `:help telescope.builtin.live_grep()` for information about particular keys
		vim.keymap.set('n', '<leader>s/', function()
			builtin.live_grep {
				grep_open_files = true,
				prompt_title = 'Live Grep in Open Files',
			}
		end, { desc = '[S]earch [/] in Open Files' })

		-- Shortcut for searching your Neovim configuration files
		vim.keymap.set('n', '<leader>sn', function()
			builtin.find_files { cwd = vim.fn.stdpath 'config' }
		end, { desc = '[S]earch [N]eovim files' })
	end,
}
