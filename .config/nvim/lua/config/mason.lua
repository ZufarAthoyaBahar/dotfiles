require("mason-lspconfig").setup {
  ensure_installed = { "html", "cssls", "clangd", "lua_ls", "tsserver", "pyright", "tailwindcss", "rust_analyzer", "pyslp" },
  automatic_installation = true,
}
