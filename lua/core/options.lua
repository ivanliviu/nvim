vim.g.mapleader = ' '
-- research ftplugin
vim.g.markdown_recommended_style = 0
vim.g.python_recommended_style = 0

vim.opt.breakindent = true
vim.opt.colorcolumn = '81'
vim.opt.cursorline = true
vim.opt.expandtab = _G.arista
vim.opt.ignorecase = true
vim.opt.inccommand = 'split'
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.numberwidth = 6
-- also depending on vim width (no-neck-pain takes up even number of spaces)
-- st should be small enough to fix exactly two max size buffers
-- test max size split, max size - 1, max size - 2, etc.?
vim.opt.relativenumber = true
vim.opt.scrolloff = 999
vim.opt.shiftwidth = _G.arista and 3 or 4
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = _G.arista and 3 or 4
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.opt.udir = vim.fn.stdpath 'cache' .. '/undo'
vim.opt.undofile = true

vim.schedule(function()
	vim.opt.clipboard = 'unnamedplus'
end)
