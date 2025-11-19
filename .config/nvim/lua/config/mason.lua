require("mason-lspconfig").setup {
  ensure_installed = { "html", "cssls", "clangd", "lua_ls", "ts_ls", "pyright", "tailwindcss", "rust_analyzer", "gopls" },

  automatic_installation = true,
}
