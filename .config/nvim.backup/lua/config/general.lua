local opt = vim.opt
local cmd = vim.cmd
opt.fillchars = { eob = ' ' }
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = true
opt.number = true
opt.guicursor = "n-v-i-c:thin-Cursor"
opt.signcolumn = 'no'
opt.clipboard = 'unnamedplus'
-- vim.o.background = "dark" -- or "light" for light mode
vim.wo.relativenumber = true
-- vim.cmd.colorscheme = "blue"
-- vim.cmd[[colorscheme tokyonight-night]]
-- vim.cmd[[colorscheme onedark]]
-- vim.cmd[[colorscheme material]]
-- vim.cmd[[colorscheme vscode]]
-- vim.cmd[[colorscheme gruvbox]]
-- vim.cmd[[colorscheme onedark_dark]]
-- vim.cmd[[colorscheme atomic]]
-- vim.cmd[[colorscheme kanagawa-dragon]]
-- vim.cmd[[colorscheme kanagawa-paper]]
vim.cmd[[colorscheme everforest]]
-- vim.cmd[[colorscheme gruvbox-material]]
-- vim.cmd[[colorscheme night-owl]]
-- vim.cmd[[colorscheme nightfox]]
