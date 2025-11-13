local conform = require("conform")

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- You can customize some of the format options for the filetype (:help conform.format)
    -- rust = { "rustfmt", lsp_format = "fallback" },
    -- Conform will run the first available formatter
    javascript = { "biome", stop_after_first = true },
    html = { "htmlbeautifier" },
    go = { "goimports", "gofmt" },
    php = { "php_cs_fixer" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

vim.keymap.set({ "n", "v" }, "<leader>fm", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  })
end)

local wk = require("which-key")

-- Definisikan fungsi format Anda (tetap sama)
local format_file = function()
  require("conform").format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  })
end

-- Daftar pemetaan Anda menggunakan format Flat Spec yang benar
wk.add({
  { "<leader>f",  group = "File" },
  { "<leader>fm", format_file,   desc = "Format File (Conform)" },
})
