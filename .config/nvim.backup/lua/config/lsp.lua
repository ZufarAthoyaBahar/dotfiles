local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local luasnip = require('luasnip')

lspconfig.pyright.setup({
  capabilities = capabilities,
})

lspconfig.gopls.setup({
  capabilities = capabilities,
})

--lspconfig.tsserver.setup({
--  capabilities = capabilities,
--})

lspconfig.html.setup({
  capabilities = capabilities,
})

lspconfig.cssls.setup({
  capabilities = capabilities,
})

lspconfig.jsonls.setup({
  capabilities = capabilities,
})

lspconfig.svelte.setup({
  capabilities = capabilities,
})

lspconfig.bashls.setup({
  capabilities = capabilities,
})

lspconfig.ts_ls.setup({
  capabilities = capabilities,
})

lspconfig.emmet_ls.setup({
  capabilities = capabilities,
})

lspconfig.biome.setup({
  capabilities = capabilities
})

lspconfig.phpactor.setup({
  capabilities = capabilities
})

lspconfig.clangd.setup{
    cmd = { "clangd", "--background-index" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = require('lspconfig').util.root_pattern("compile_commands.json", ".git"),
    capabilities = capabilities
}

-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
 snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)  -- For `luasnip` users.
        end,
    },
 mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, {"i", "s"}),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, {"i", "s"}),
  }),
  -- sources for autocompletion
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- LSP
    { name = "buffer" }, -- text within the current buffer
    { name = "path" }, -- file system paths
    { name = "luasnip"}
  }),
})
require('luasnip.loaders.from_vscode').lazy_load()
