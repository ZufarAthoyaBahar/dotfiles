local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- lua = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    cpp = { "clang-format" },
    python = { "autopep8" },
    typescript = { "prettier" },
    javascript = { "prettier" },
    json = { "prettier" },
    markdown = { "prettier" },
    rust = { "rustfmt" },
    latex = { "latexindent" },
    go = { "gofmt" },
    astro = { "astrofmt" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
