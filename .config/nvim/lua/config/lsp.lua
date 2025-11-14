-- 1. Dapatkan Capabilities (penting untuk integrasi autokomplet seperti nvim-cmp)
-- Jika Anda menggunakan nvim-cmp, aktifkan baris ini:
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Jika tidak, gunakan yang standar:
local capabilities = vim.lsp.protocol.make_client_capabilities()


-- 2. Definisikan Fungsi on_attach (Ini menggantikan autocmd LspAttach Anda)
local on_attach = function(client, bufnr)
  vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
  local opts = { buffer = bufnr }

  -- Set semua keymap Anda di sini
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<space>f", function()
    vim.lsp.buf.format { async = true }
  end, opts)
end


-- 3. Daftar server (Diperbarui: ts_ls diubah menjadi tsserver)
local servers = { "html", "cssls", "clangd", "lua_ls", "tsserver", "pyright", "tailwindcss", "rust_analyzer",
  "pylsp, gopls" }


-- 4. Aktifkan server (untuk server dengan konfigurasi default)
-- Kita menggunakan vim.lsp.config untuk mengaplikasikan on_attach ke semua server di atas.
for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
vim.lsp.enable(servers)


-- 5. Konfigurasi khusus untuk 'astro'
-- Konfigurasi astro di sini (dengan menambahkan on_attach dan capabilities)
vim.lsp.config("astro", {
  filetypes = { "astro" },
  on_attach = on_attach,
  capabilities = capabilities,
})
vim.lsp.enable("astro")
vim.diagnostic.config({
  virtual_text = true,      -- Mengaktifkan teks error/warning di samping baris kode
  signs = true,             -- Mengaktifkan ikon di sign column (kolom kiri)
  update_in_insert = false, -- Jangan update saat mode Insert
  float = {                 -- Konfigurasi jendela pop-up saat hover
    border = 'single',
    source = 'always',
    header = '',
  },
})
-- CATATAN PENTING:
-- Hapus seluruh blok vim.api.nvim_create_autocmd("LspAttach", ...) yang lama
-- karena fungsinya sudah digantikan oleh on_attach di atas.
