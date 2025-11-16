require('config.lazy')
require('config.general')
require('config.lsp')
require('config.autopairs')
require('config.formatter')
require('config.telescope')
require('config.cord')
require('config.treesitter')
require('config.alpha')
require('render-markdown')
require('config.keymaps')
require('config.bufferline')
require('config.gitsigns')
require('config.lualine')
require('config.indent-blankline')
require('config.mason')
require('config.line-number')

-- require('config.cmp')

local theme_file = vim.fn.stdpath("config") .. "/lua/current-theme.lua"
if vim.fn.filereadable(theme_file) == 1 then
  pcall(dofile, theme_file)
end
