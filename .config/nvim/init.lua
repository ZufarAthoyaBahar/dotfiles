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

-- require("termui")
--
-- -- keymap
-- vim.keymap.set("n", "<leader>tt", function()
--   require("termui").open()
-- end)
--
-- vim.keymap.set("n", "<leader>tn", function()
--   require("termui").new()
-- end)

-- Import modul yang baru kita buat (asumsikan nama filenya lua/myterm.lua)

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

require("custom.floatterm")

-- vim.opt.runtimepath:prepend(vim.fn.stdpath("data") .. "/lazy/nvim-treesitter")
