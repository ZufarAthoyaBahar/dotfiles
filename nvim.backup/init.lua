require('config.lazy')
require('config.general')
require('config.lsp')
require('config.autopairs')
require('config.formatter')
require('config.telescope')
require('config.treesitter')
require'lspconfig'.ts_ls.setup {
  -- Sesuaikan konfigurasi jika perlu
}
-- require('config.nvim-tree')
